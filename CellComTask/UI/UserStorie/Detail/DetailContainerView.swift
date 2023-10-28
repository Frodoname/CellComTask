//
//  DetailContainerView.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import SwiftUI

struct DetailContainerView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                UnifiedAsyncImage(url: movie.mainImage)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                if let title = movie.title {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                }
                HStack {
                    VStack(alignment: .leading) {
                        if let rating = movie.rating {
                            Text(Texts.movieRating(rating))
                                .font(.subheadline)
                                .padding(.top, 4)
                            
                        }
                        if let genre = movie.genre {
                            Text(genre.map { $0.title }.joined(separator: ", "))
                                .font(.subheadline)
                                .padding(.top, 4)
                        }
                    }
                    Spacer()
                    favoriteButton
                        .padding(.trailing, 16)
                }
                if let description = movie.description {
                    Text(description)
                        .font(.body)
                        .padding(.top, 12)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @State private var isFavorite: Bool
    
    private var favoriteButton: some View {
        Button {
            isFavorite.toggle()
            viewModel.toggleFavoriteStatus(for: movie)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .foregroundColor(isFavorite ? .red : .gray)
                .frame(width: 28, height: 28)
        }
    }
    
    init(movie: Movie) {
        self.movie = movie
        _isFavorite = State(initialValue: movie.isFavorite)
    }
}
