//
//  URLRequestBuilder.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

protocol URLRequestBuilder {
    func buildRequest(from endpoint: EndpointConfigurable) throws -> URLRequest
}

final class DefaultURLRequestBuilder: URLRequestBuilder {
    func buildRequest(from endpoint: EndpointConfigurable) throws -> URLRequest {
        guard let url = endpoint.baseURL else { throw APIProviderError.invalidEndpoint }
        var request = URLRequest(url: url, timeoutInterval: 15)
        request.httpMethod = endpoint.httpMethod.rawValue
        return request
    }
}
