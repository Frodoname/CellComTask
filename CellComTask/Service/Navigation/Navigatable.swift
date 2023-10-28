//
//  Navigatable.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

/// The `Navigatable` protocol defines an interface for objects that can navigate between different views or routes
///
/// By conforming to this protocol, an object is expected to manage the navigation flow in the application, keeping track
/// of active routes, and providing functionality for navigating forwards, backwards, and to specific points in the navigation stack.
///
/// This is especially useful in scenarios where a task initiated on a screen might need to be cancelled if the user navigates away
/// from that screen.
///
/// - Note:
///   - As it also conforms to `ObservableObject`, any changes to the navigation state can be observed by SwiftUI views.
protocol Navigatable: ObservableObject {
    var router: NavigationManager { get }
    func popToRoot()
    func popTo(_ route: Route)
    func popTo(_ routes: [Route])
    func pop(_ count: Int) -> Bool
    func pop(_ route: Route) -> Bool
    func resetNavigationStack()
}

extension Navigatable {
    var router: NavigationManager {
        NavigationManager.shared
    }
    
    /// The `popToRoot` function clears the navigation stack except for the first route (root).
    /// It essentially navigates the user back to the root screen/view.
    func popToRoot() {
        let numberOfViews = router.selectionPath.count
        router.selectionPath.removeLast(numberOfViews - 1)
    }

    /// The `popTo(_:)` function appends a new route to the navigation stack.
    /// This is typically used to navigate the user to a new screen.
    /// - Parameter route: The `Route` object representing the screen to navigate to.
    func popTo(_ route: Route) {
        router.selectionPath.append(route)
    }

    /// The `popTo(_:)` function appends an array of new routes to the navigation stack.
    /// This is typically used to set up a specific sequence of screens.
    /// - Parameter routes: The array of `Route` objects representing the sequence of screens to navigate to.
    func popTo(_ routes: [Route]) {
        routes.forEach { router.selectionPath.append($0) }
    }

    /// The `pop(_:)` function removes a specific number of routes from the navigation stack.
    /// This is typically used to navigate the user back by a specific number of screens.
    /// - Parameter count: The number of screens to navigate back. Default is 1.
    /// - Returns: `Bool` indicating whether the navigation to the specific screen was successful.
    @discardableResult
    func pop(_ count: Int = 1) -> Bool {
        guard
            router.selectionPath.count - count >= 0,
            router.selectionPath.count >= 0 else {
            return false
        }
        router.selectionPath.removeLast(count)
        return true
    }

    /// The `pop(_:)` function tries to navigate to a specific screen by trimming the navigation stack.
    /// It iteratively removes the top-most screen from the stack until it reaches the desired screen.
    /// If the desired screen is not found in the stack, the function does nothing and returns `false`.
    /// If the screen is found and successfully navigated to, the function returns `true`.
    /// - Parameter route: The `Route` object representing the screen to navigate to.
    /// - Returns: `Bool` indicating whether the navigation to the specific screen was successful.
    @discardableResult
    func pop(_ route: Route) -> Bool {
        guard let index = router.selectionPath.firstIndex(of: route) else { return false }
        router.selectionPath = Array(router.selectionPath.prefix(upTo: index + 1))
        return true
    }

    /// The `resetNavigationStack` function clears the entire navigation stack.
    /// It is typically used when you need to completely reset the navigation history,
    /// for example, when a user logs out of the application.
    func resetNavigationStack() {
        router.selectionPath.removeAll()
    }
}
