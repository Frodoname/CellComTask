//
//  HomeViewModel.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    let moviesFilter = MovieFilter.allCases
    
    private let movieAPI: MovieAPI
    
    private var popularMoviesPage = 1
    private var airingMoviesPage = 1
    private var popularMoviesPaginationInfo: PaginationInfo?
    private var airingMoviesPaginationInfo: PaginationInfo?
    private var subscriptionsSet = Set<AnyCancellable>()
    
    @Published var selectedFilter: MovieFilter = .popular
    @Published var isError = false

    @Published private(set) var popularMovies: [Movie] = []
    @Published private(set) var airingMovies: [Movie] = []
    @Published private(set) var favouriteMovies: [Movie] = []
    @Published private(set) var errorText: String?
        
    // MARK: - Initializer
    init(movieAPI: MovieAPI) {
        self.movieAPI = movieAPI
        addSubscriptions()
    }
    
    // MARK: - Methods
    @MainActor
    func loadNextPage(for movie: Movie) {
        switch selectedFilter {
        case .popular:
            guard
                let info = popularMoviesPaginationInfo,
                let index = popularMovies.firstIndex(where: {$0 == movie}),
                info.page < info.totalPages,
                index == popularMovies.count - 2 else {
                return
            }
            popularMoviesPage += 1
            fetchPopularMovies()
        case .currentlyAiring:
            guard
                let info = airingMoviesPaginationInfo,
                let index = airingMovies.firstIndex(where: {$0 == movie}),
                info.page < info.totalPages,
                index == airingMovies.count - 2 else {
                return
            }
            
            airingMoviesPage += 1
            fetchAiringMovies()
        default:
            break
        }
    }
    
    func toggleFavoriteStatus(for movie: Movie) {
        if let popularMovieIndex = popularMovies.firstIndex(where: {$0.movieID == movie.movieID}) {
            popularMovies[popularMovieIndex] = movie.markFavourite
        }
        
        if let airingMovieIndex = airingMovies.firstIndex(where: {$0.movieID == movie.movieID}) {
            airingMovies[airingMovieIndex] = movie.markFavourite
        }
        updateFavoriteMovies()
    }
    
    @MainActor
    private func fetchPopularMovies() {
        Task {
            let result = await movieAPI.fetchPopularMovies(popularMoviesPage)
            
            switch result {
            case .success(let data):
                popularMovies.append(contentsOf: data.movies)
                popularMoviesPaginationInfo = data.paginationInfo
            case .failure(let error):
                errorText = error.localizedDescription
                isError = true
            }
        }
    }
    
    @MainActor
    private func fetchAiringMovies() {
        Task {
            let result = await movieAPI.fetchNowPlayingMobies(airingMoviesPage)
            
            switch result {
            case .success(let data):
                airingMovies.append(contentsOf: data.movies)
                airingMoviesPaginationInfo = data.paginationInfo
            case .failure(let error):
                errorText = error.localizedDescription
                isError = true
                print(error)
            }
        }
    }
    
    private func addSubscriptions() {
        let filtering: (MovieFilter) -> Void = { [weak self] filter in
            guard let self else { return }
            switch filter {
            case .popular:
                guard self.popularMovies.isEmpty else { return }
                Task {
                    await self.fetchPopularMovies()
                }
            case .currentlyAiring:
                guard self.airingMovies.isEmpty else { return }
                Task {
                    await self.fetchAiringMovies()
                }
            case .favourite:
                updateFavoriteMovies()
            }
        }
        
        $selectedFilter
            .sink(receiveValue: filtering)
            .store(in: &subscriptionsSet)
    }
    
    private func updateFavoriteMovies() {
        favouriteMovies = (popularMovies + airingMovies)
            .filter { $0.isFavorite }
            .uniqued()
    }
}

extension HomeViewModel: Navigatable { }
