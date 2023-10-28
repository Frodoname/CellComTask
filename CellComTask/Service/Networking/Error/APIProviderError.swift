//
//  APIProviderError.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

enum APIProviderError: LocalizedError {
    case invalidEndpoint
    case emptyTokenManager
    case invalidResponse
    case decodingError(Error)
    case encodingError(Error)
    case serverError(APIError)
    case timeoutError
    case noInternetConnection
    case unexpectedError(Error)
}
