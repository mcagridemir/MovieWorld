//
//  ImageCollectionViewCell.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit
import SDWebImage
import SkeletonView

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCell(movie: Movie?) {
        imageView.showAnimatedGradientSkeleton()
        imageView.sd_setImage(with: URL(string: Globals.shared.imageBaseUrl + (movie?.posterPath ?? ""))) { [weak self] _, _, _, _ in
            guard let self = self else { return }
            self.imageView.hideSkeleton()
            self.imageView.isSkeletonable = false
        }
        let releaseYear = movie?.releaseDate?.prefix(4) ?? ""
        titleLabel.font = FontFamily.SFProDisplay.bold.font(size: 20)
        descriptionLabel.font = Helper.getFont(type: .medium, size: 12)
        titleLabel.text = "\(movie?.title ?? "") (\(releaseYear))"
        descriptionLabel.text = movie?.overview
    }
}
