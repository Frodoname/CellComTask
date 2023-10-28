//
//  DTOConvertible.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

/// Protocol defining a type that can be initialized from a Data Transfer Object (DTO).
protocol DTOConvertible {
    
    /// The type of the DTO, which must conform to `Decodable`.
    associatedtype DTO: Decodable

    /// Initializes a new instance of the conforming type from the specified DTO.
    ///
    /// - Parameter model: The DTO from which to initialize the conforming type.
    /// - Throws: An error if the initialization fails.
    init(model: DTO) throws
}
