//
//  PaginatedMovies.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

struct PaginatedMovies: DTOConvertible {
    let paginationInfo: PaginationInfo
    let movies: [Movie]
    
    init(model: MoviesDTO) throws {
        self.paginationInfo = .init(page: model.page, totalPages: model.totalPages, totalResults: model.totalResults)
        self.movies = model.results.map { .init(dto: $0) }
    }
}

struct PaginationInfo {
    let page: Int
    let totalPages: Int
    let totalResults: Int
}

struct Movie {
    let id: UUID
    let movieID: Int?
    let title: String?
    let description: String?
    let mainImage: URL?
    let backgroundImage: URL?
    let rating: Float?
    let genre: [Genre]?
    let isFavorite: Bool
    
    fileprivate init(dto: MoviesDTO.MovieDTO) {
        self.id = .init()
        self.movieID = dto.id
        self.title = dto.originalTitle
        self.description = dto.overview
        
        if let posterPath = dto.posterPath {
            self.mainImage = URL(string: "https://\(ConfigManager.getValue(for: .imageURL) + (posterPath))")
        } else {
            self.mainImage = nil
        }
        
        if let backdropPath = dto.backdropPath {
            self.backgroundImage = URL(string: "https://\(ConfigManager.getValue(for: .imageURL) + (backdropPath))")
        } else {
            self.backgroundImage = nil
        }
        
        if let rating = dto.voteAverage {
            self.rating = Float(rating)
        } else {
            self.rating = nil
        }
        
        if let genresIDs = dto.genreIds {
            let genre = genresIDs.compactMap { Genre(rawValue: $0) }
            self.genre = genre.isEmpty ? [.noGenre] : genre
        } else {
            self.genre = nil
        }
        
        self.isFavorite = false
    }
    
    init(
        id: UUID = .init(),
        movieID: Int? = nil,
        title: String? = nil,
        description: String? = nil,
        mainImage: URL? = nil,
        backgroundImage: URL? = nil,
        rating: Float? = nil,
        genre: [Genre]? = nil,
        isFavorite: Bool
    ) {
        self.id = id
        self.movieID = movieID
        self.title = title
        self.description = description
        self.mainImage = mainImage
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.genre = genre
        self.isFavorite = isFavorite
    }
}

extension Movie: Identifiable, Equatable, Hashable { }

extension Movie {
    var markFavourite: Self {
        .init(
            id: id,
            movieID: movieID,
            title: title,
            description: description,
            mainImage: mainImage,
            backgroundImage: backgroundImage,
            rating: rating,
            genre: genre,
            isFavorite: !isFavorite
        )
    }
}
