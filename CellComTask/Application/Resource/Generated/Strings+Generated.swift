// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum Texts {
  /// Action
  internal static let action = Texts.tr("Localizable", "action")
  /// Adventure
  internal static let adventure = Texts.tr("Localizable", "adventure")
  /// Animation
  internal static let animation = Texts.tr("Localizable", "animation")
  /// Comedy
  internal static let comedy = Texts.tr("Localizable", "comedy")
  /// Crime
  internal static let crime = Texts.tr("Localizable", "crime")
  /// Currently Airing
  internal static let currentlyAiring = Texts.tr("Localizable", "currentlyAiring")
  /// Documentary
  internal static let documentary = Texts.tr("Localizable", "documentary")
  /// Drama
  internal static let drama = Texts.tr("Localizable", "drama")
  /// Family
  internal static let family = Texts.tr("Localizable", "family")
  /// Fantasy
  internal static let fantasy = Texts.tr("Localizable", "fantasy")
  /// Favourite
  internal static let favourite = Texts.tr("Localizable", "favourite")
  /// Filter
  internal static let filter = Texts.tr("Localizable", "filter")
  /// Got it!
  internal static let gotIt = Texts.tr("Localizable", "gotIt")
  /// History
  internal static let history = Texts.tr("Localizable", "history")
  /// Horror
  internal static let horror = Texts.tr("Localizable", "horror")
  /// Rating: %.1f
  internal static func movieRating(_ p1: Float) -> String {
    return Texts.tr("Localizable", "movie_rating", p1)
  }
  /// Movie App
  internal static let movieApp = Texts.tr("Localizable", "movieApp")
  /// Music
  internal static let music = Texts.tr("Localizable", "music")
  /// Mystery
  internal static let mystery = Texts.tr("Localizable", "mystery")
  /// No favorites yet
  internal static let noFavorYet = Texts.tr("Localizable", "noFavorYet")
  /// No info about genre
  internal static let noGenre = Texts.tr("Localizable", "noGenre")
  /// Popular
  internal static let popular = Texts.tr("Localizable", "popular")
  /// Romance
  internal static let romance = Texts.tr("Localizable", "romance")
  /// Science Fiction
  internal static let scienceFiction = Texts.tr("Localizable", "science_fiction")
  /// Ooops! Something went wrong :(
  internal static let smthWentWrong = Texts.tr("Localizable", "smthWentWrong")
  /// Thriller
  internal static let thriller = Texts.tr("Localizable", "thriller")
  /// TV Movie
  internal static let tvMovie = Texts.tr("Localizable", "tv_movie")
  /// War
  internal static let war = Texts.tr("Localizable", "war")
  /// Western
  internal static let western = Texts.tr("Localizable", "western")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension Texts {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
