//
//  NowPlayingMoviesEndpoint.swift
//  CellComTask
//
//  Created by Fed on 28.10.2023.
//

import Foundation

struct NowPlayingMoviesEndpoint: EndpointConfigurable {
    let page: String
        
    var httpMethod: HTTPMethod {
        .get
    }
    
    var path: String {
        "/3/movie/now_playing"
    }
    
    var additionalQueryItems: [URLQueryItem] {
        [.init(name: "language", value: "en-US"), .init(name: "page", value: page)]
    }
    
    init(page: Int) {
        self.page = String(page)
    }
}
