//
//  PopularMoviesEndpoint.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

struct PopularMoviesEndpoint: EndpointConfigurable {
    let page: String
        
    var httpMethod: HTTPMethod {
        .get
    }
    
    var path: String {
        "/3/movie/popular"
    }
    
    var additionalQueryItems: [URLQueryItem] {
        [.init(name: "language", value: "en-US"), .init(name: "page", value: page)]
    }
    
    init(page: Int) {
        self.page = String(page)
    }
}
