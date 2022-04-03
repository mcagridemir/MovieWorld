//
//  MovieTableViewCell.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import UIKit
import SDWebImage
import SkeletonView

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func initCell(movie: Movie?) {
        movieImageView.showAnimatedGradientSkeleton()
        movieImageView.sd_setImage(with: URL(string: Globals.shared.imageBaseUrl + (movie?.posterPath ?? ""))) { [weak self] _, _, _, _ in
            guard let self = self else { return }
            self.movieImageView.hideSkeleton()
        }
        let releaseYear = movie?.releaseDate?.prefix(4) ?? ""
        titleLabel.font = Helper.getFont(type: .bold, size: 15)
        descriptionLabel.font = Helper.getFont(type: .medium, size: 13)
        dateLabel.font = Helper.getFont(type: .medium, size: 12)
        titleLabel.text = "\(movie?.title ?? "") (\(releaseYear))"
        descriptionLabel.text = movie?.overview
        dateLabel.text = Helper.formatDate(dateTxt: movie?.releaseDate ?? "", inputFormat: "yyyy-MM-dd", outputFormat: "dd.MM.yyyy")
    }
}

