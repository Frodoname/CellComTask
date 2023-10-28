//
//  MovieList.swift
//  CellComTask
//
//  Created by Fed on 28.10.2023.
//

import SwiftUI

struct MovieList: View {
    var body: some View {
        switch viewModel.selectedFilter {
        case .popular:
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 250))], spacing: 20) {
                    ForEach(viewModel.popularMovies) { movie in
                        MovieCell(movie: movie)
                            .onAppear {
                                viewModel.loadNextPage(for: movie)
                            }
                            .onTapGesture {
                                viewModel.popTo(.detail(movie))
                            }
                    }
                }
            }
        case .currentlyAiring:
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 250))], spacing: 20) {
                    ForEach(viewModel.airingMovies) { movie in
                        MovieCell(movie: movie)
                            .onAppear {
                                viewModel.loadNextPage(for: movie)
                            }
                            .onTapGesture {
                                viewModel.popTo(.detail(movie))
                            }
                    }
                }
            }
        case .favourite:
            if viewModel.favouriteMovies.isEmpty {
                Spacer()
                Text(Texts.noFavorYet)
                Image(systemName: "face.smiling")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                Spacer()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(viewModel.favouriteMovies) { movie in
                            MovieCell(movie: movie)
                                .onTapGesture {
                                    viewModel.popTo(.detail(movie))
                                }
                        }
                    }
                }
            }
        }
        
    }
    
    @EnvironmentObject private var viewModel: HomeViewModel
}
