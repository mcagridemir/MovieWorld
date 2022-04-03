//
//  ImageSliderView.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit

protocol ImageSliderViewDelegate: AnyObject {
    func movieDetailNavigation(id: String)
}

class ImageSliderView: BaseView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    private var count = 0
    private var movies: [Movie]?
    private var timer = Timer()
    private var counter = 0
    weak var delegate: ImageSliderViewDelegate?
    
    override func setup() {
        configureNib()
    }
    
    func configureUI(movies: [Movie]?) {
        self.count = movies?.count ?? 0
        pageControl.numberOfPages = count
        self.movies = movies
        initCollectionView()
        // If we want to make view auto scroll then we can comment out these 3 lines below. 
        if count > 0 {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    private func initCollectionView() {
        collectionViewHeight.constant = Globals.shared.screenWidth * 0.6826666667
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(ImageCollectionViewCell.self)
        collectionView.decelerationRate = .normal
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func indexOfMajorCell() -> Int {
        let contentX = self.collectionView.contentOffset.x
        let proportionalOffset = contentX / Globals.shared.screenWidth
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min((count) - 1, index))
        return safeIndex
    }
    
    @objc private func changeImage() {
        if counter < count {
            let indexPath = IndexPath.init(item: counter, section: 0)
            DispatchQueue.main.async {
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let indexPath = IndexPath.init(item: counter, section: 0)
            DispatchQueue.main.async {
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            }
            pageControl.currentPage = counter
            counter = 1
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension ImageSliderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath) else { return UICollectionViewCell() }
        let movie = movies?[indexPath.row]
        cell.initCell(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies?[indexPath.row]
        delegate?.movieDetailNavigation(id: String(movie?.id ?? 0))
    }
}

extension ImageSliderView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            let currentCellIndex = indexOfMajorCell()
            self.pageControl.currentPage = currentCellIndex
        }
    }
}

extension ImageSliderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}
