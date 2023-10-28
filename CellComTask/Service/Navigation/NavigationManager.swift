//
//  NavigationManager.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

/** `NavigationManager` is a class that manages the navigation stack in an application.
 It keeps track of the selected routes (or screens) in a stack like structure.
 */
final class NavigationManager: ObservableObject {
    static let shared = NavigationManager()

    /// `selectionPath` is an array of `Route` objects that represents the navigation stack or history.
    @Published var selectionPath: [Route] = []
    
    private init() { }
}
