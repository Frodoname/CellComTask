//
//  MovieAPI.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

final class MovieAPI {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies(_ page: Int = 1) async -> Result<PaginatedMovies, Error> {
        let popularMoviesEndpoint = PopularMoviesEndpoint(page: page)
        
        do {
            let dtoData = try await networkService.perform(popularMoviesEndpoint, responseModel: MoviesDTO.self)
            let appData = try PaginatedMovies(model: dtoData)
            return .success(appData)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchNowPlayingMobies(_ page: Int = 1) async -> Result<PaginatedMovies, Error> {
        let nowPlayingMoviesEndpoint = NowPlayingMoviesEndpoint(page: page)
        
        do {
            let dtoData = try await networkService.perform(nowPlayingMoviesEndpoint, responseModel: MoviesDTO.self)
            let appData = try PaginatedMovies(model: dtoData)
            return .success(appData)
        } catch {
            return .failure(error)
        }
    }
}
