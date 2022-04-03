//
//  MovieModel.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let results: [Movie]?
}

// MARK: - Result
struct Movie: Codable {
    let id: Int?
    let overview: String?
    let imdbId: String?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case imdbId = "imdb_id"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
