//
//  Genre.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

enum Genre: Int {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mystery = 9648
    case romance = 10749
    case scienceFiction = 878
    case tvMovie = 10770
    case thriller = 53
    case war = 10752
    case western = 37
    case noGenre
    
    var title: String {
        switch self {
        case .action:
            return Texts.action
        case .adventure:
            return Texts.adventure
        case .animation:
            return Texts.animation
        case .comedy:
            return Texts.comedy
        case .crime:
            return Texts.crime
        case .documentary:
            return Texts.documentary
        case .drama:
            return Texts.drama
        case .family:
            return Texts.family
        case .fantasy:
            return Texts.fantasy
        case .history:
            return Texts.history
        case .horror:
            return Texts.horror
        case .music:
            return Texts.music
        case .mystery:
            return Texts.mystery
        case .romance:
            return Texts.romance
        case .scienceFiction:
            return Texts.scienceFiction
        case .tvMovie:
            return Texts.tvMovie
        case .thriller:
            return Texts.thriller
        case .war:
            return Texts.war
        case .western:
            return Texts.western
        case .noGenre:
            return Texts.noGenre
        }
    }
    
    var id: Self {
        self
    }
}

extension Genre: Identifiable { }
