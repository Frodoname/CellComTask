//
//  NetworkService.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

final class NetworkService {
    private let requestBuilder: URLRequestBuilder
    private let taskExecutor: DataTaskExecutor
    private let dataDecoder: DataDecoder
    
    init(
        requestBuilder: URLRequestBuilder,
        taskExecutor: DataTaskExecutor,
        dataDecoder: DataDecoder
    ) {
        self.requestBuilder = requestBuilder
        self.taskExecutor = taskExecutor
        self.dataDecoder = dataDecoder
    }
    
    func perform<T: Decodable>(
        _ endpoint: EndpointConfigurable,
        responseModel: T.Type
    ) async throws -> T {
        let request = try requestBuilder.buildRequest(from: endpoint)
        
        do {
            let (data, response) = try await taskExecutor.executeDataTask(with: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIProviderError.invalidResponse
            }
            
            if let apiError = APIError(data: data, response: httpResponse) {
                throw APIProviderError.serverError(apiError)
            }
            
            let decodedData: T = try dataDecoder.decode(data: data, type: responseModel)
            
            return decodedData
        } catch {
            throw error
        }
    }
}
