//
//  EndpointConfigurable.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

protocol EndpointConfigurable {
    var httpMethod: HTTPMethod { get }
    var baseURL: URL? { get }
    var path: String { get }
    var additionalQueryItems: [URLQueryItem] { get }
}

extension EndpointConfigurable {
    var baseURL: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ConfigManager.getValue(for: .baseURL)
        components.path = path
        components.queryItems = defaultQueryItems + additionalQueryItems
        return components.url
    }
    
    var defaultQueryItems: [URLQueryItem] {
        [URLQueryItem(name: "api_key", value: ConfigManager.getValue(for: .apiKey))]
    }
}
