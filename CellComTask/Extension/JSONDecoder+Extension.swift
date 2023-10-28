//
//  JSONDecoder+Extension.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

/// Extension for `JSONDecoder` to provide a convenience decoder for handling snake_case keys.
extension JSONDecoder {

    /// A static property providing a `JSONDecoder` configured to convert snake_case keys to camelCase.
    static var snakeCaseDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
