//
//  MovieDTO.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

struct MoviesDTO: Decodable {
    let page: Int
    let results: [MovieDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct MovieDTO: Decodable {
        let adult: Bool?
        let backdropPath: String?
        let genreIds: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle: String?
        let overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate: String?
        let title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?
    }
}
