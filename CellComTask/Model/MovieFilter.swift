//
//  MovieFilter.swift
//  CellComTask
//
//  Created by Fed on 28.10.2023.
//

import Foundation

enum MovieFilter {
    case popular
    case currentlyAiring
    case favourite
    
    var title: String {
        switch self {
        case .popular:
            return Texts.popular
        case .currentlyAiring:
            return Texts.currentlyAiring
        case .favourite:
            return Texts.favourite
        }
    }
}

extension MovieFilter: CaseIterable, Identifiable {
    var id: Self {
        self
    }
}
