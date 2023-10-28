//
//  Sequence+Extension.swift
//  CellComTask
//
//  Created by Fed on 28.10.2023.
//

import Foundation

/// This extension adds functionality to sequences whose elements conform to the `Hashable` protocol.
extension Sequence where Element: Hashable {
    /// The method utilizes a `Set` to efficiently determine if an element has been encountered before in the sequence. This allows it to maintain the original order of the sequence's elements, providing a combination of the benefits of both arrays and sets.

    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
