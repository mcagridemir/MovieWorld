//
//  MainViewController.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MainPageViewModel()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObservers()
        initViews()
    }
    
    private func initViews() {
        hideNavbar = true
        initTableView()
    }
    
    private func initObservers() {
        viewModel.nowPlayingMovies.bind { [weak self] _ in
            guard let self = self else { return }
            self.reloadData()
            self.endTableViewRefreshing()
        }
        viewModel.upcomingMovies.bind { [weak self] _ in
            guard let self = self else { return }
            self.reloadData()
            self.endTableViewRefreshing()
        }
        viewModel.isLoading.bind { isLoading in
            DispatchQueue.main.async {
                isLoading ?? false ? Loader.show() : Loader.hide()
            }
        }
        viewModel.error.bind { error in
            DispatchQueue.main.async {
                Alert.error(title: "", text: error?.rawValue ?? "")
            }
        }
        viewModel.getUpcoming()
        viewModel.getNowPlaying()
    }
    
    private func initTableView() {
        tableView.registerNib(MovieTableViewCell.self)
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        tableView.contentInsetAdjustmentBehavior = .never
        if #available(iOS 15.0, *) {
            self.tableView.sectionHeaderTopPadding = 0.0
        }
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc private func refreshData(_ sender: Any) {
        viewModel.getNowPlaying(true)
        viewModel.getUpcoming(true)
    }
    
    private func endTableViewRefreshing() {
        if self.tableView.refreshControl?.isRefreshing ?? false {
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.upcomingMoviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MovieTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath) else { return UITableViewCell() }
        let movie = viewModel.upcomingMovies.value?[indexPath.row]
        cell.initCell(movie: movie)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ImageSliderView()
        view.delegate = self
        view.configureUI(movies: viewModel.nowPlayingMovies.value)
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if viewModel.shouldDisplayLoading {
            let view = UIView()
            let spinner = UIActivityIndicatorView()
            spinner.startAnimating()
            spinner.color = .black
            spinner.frame = CGRect(x: (tableView.frame.width / 2) - 25, y: 0, width: 50, height: 50)
            view.removeFromSuperview()
            view.addSubview(spinner)
            return view
        }
        return UICollectionReusableView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.upcomingMovies.value?[indexPath.row]
        MainPageRouter.showDetailPage(id: String(movie?.id ?? 0), nav: navigationController, viewController: self)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.isMore && (viewModel.upcomingMovies.value?.count ?? 0) - 1 == indexPath.row {
            viewModel.shouldDisplayLoading = true
            viewModel.getUpcoming()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.shouldDisplayLoading ? 60 : 0
    }
}

extension MainViewController: ImageSliderViewDelegate {
    func movieDetailNavigation(id: String) {
        MainPageRouter.showDetailPage(id: id, nav: navigationController, viewController: self)
    }
}
