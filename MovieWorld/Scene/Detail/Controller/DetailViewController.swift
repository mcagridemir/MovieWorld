//
//  DetailViewController.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imdbImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    private var id: String?
    private let viewModel = DetailViewModel()
    
    func initWithId(id: String) {
        self.id = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObservers()
    }
    
    private func initViews(movie: Movie?) {
        let releaseYear = movie?.releaseDate?.prefix(4) ?? ""
        let title = "\(movie?.title ?? "") (\(releaseYear))"
        self.setHeaderNativeBackTitleWhite(title: title)
        rateLabel.font = Helper.getFont(type: .medium, size: 13)
        dateLabel.font = Helper.getFont(type: .medium, size: 13)
        titleLabel.font = FontFamily.SFProDisplay.bold.font(size: 20)
        descriptionLabel.font = Helper.getFont(type: .regular, size: 15)
        self.imageView.showAnimatedGradientSkeleton()
        self.imageView.sd_setImage(with: URL(string: Globals.shared.imageBaseUrl + (movie?.posterPath ?? ""))) { [weak self] _, _, _, _ in
            guard let self = self else { return }
            self.imageView.hideSkeleton()
        }
        let rateText = LocalizationKeys.rate(movie?.voteAverage ?? 0)
        let outOfTen = LocalizationKeys.rate("")
        var convertedRange = NSRange()
        if let range = rateText.range(of: outOfTen) {
            convertedRange = NSRange(range, in: rateText)
        }
        let myMutableString = NSMutableAttributedString(string: rateText, attributes: [NSAttributedString.Key.font: Helper.getFont(type: .medium, size: 13)])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: Assets.Colors.MainColors.adb5Bd.color, range: convertedRange)
        self.rateLabel.attributedText = myMutableString
        self.dateLabel.text = Helper.formatDate(dateTxt: movie?.releaseDate ?? "", inputFormat: "yyyy-MM-dd", outputFormat: "dd.MM.yyyy")
        self.titleLabel.text = title
        self.descriptionLabel.text = movie?.overview
        self.imdbImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didImdbImageViewTapped))
        self.imdbImageView.addGestureRecognizer(gesture)
    }
    
    private func initObservers() {
        viewModel.movie.bind { movie in
            self.initViews(movie: movie)
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
        viewModel.getMovieDetail(id: id)
    }
    
    @objc private func didImdbImageViewTapped() {
        if let movie = viewModel.movie.value, let url = URL(string: Globals.shared.imdbBaseUrl + (movie.imdbId ?? "")) {
            UIApplication.shared.open(url)
        }
    }
}
