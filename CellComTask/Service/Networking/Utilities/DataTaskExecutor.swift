//
//  DataTaskExecutor.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

protocol DataTaskExecutor {
    func executeDataTask(with request: URLRequest) async throws -> (Data, URLResponse)
}

final class DefaultDataTaskExecutor: DataTaskExecutor {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func executeDataTask(with request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            let (data, response) = try await session.data(for: request)
            return (data, response)
        } catch {
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    throw APIProviderError.noInternetConnection
                case .timedOut:
                    throw APIProviderError.timeoutError
                default:
                    throw APIProviderError.unexpectedError(error)
                }
            } else {
                throw APIProviderError.unexpectedError(error)
            }
        }
    }
}
