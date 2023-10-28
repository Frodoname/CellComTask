//
//  MovieCell.swift
//  CellComTask
//
//  Created by Fed on 28.10.2023.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 0) {
            UnifiedAsyncImage(url: movie.backgroundImage)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    if let title = movie.title {
                        Text(title)
                            .lineLimit(1)
                            .font(.headline)
                    }
                    
                    if let rating = movie.rating {
                        Text(String(format: "%.1f", rating))
                            .font(.caption)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                    if let genre = movie.genre {
                        Text(genre.map { $0.title }.joined(separator: ", "))
                            .lineLimit(1)
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding()
                Spacer()
            }
            .background(.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 10)
    }
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
}
