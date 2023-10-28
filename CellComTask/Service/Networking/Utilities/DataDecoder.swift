//
//  DataDecoder.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

protocol DataDecoder {
    func decode<T: Decodable>(data: Data, type: T.Type) throws -> T
}

final class DefaultDataDecoder: DataDecoder {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func decode<T: Decodable>(data: Data, type: T.Type) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIProviderError.decodingError(error)
        }
    }
}
