//
//  APIError.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

struct APIError: LocalizedError {
    let statusCode: HTTPStatusCode
    let message: String?
    let errorData: Data?
    
    init?(data: Data, response: HTTPURLResponse) {
        guard let statusCode = HTTPStatusCode(rawValue: response.statusCode) else { return nil }
        
        self.statusCode = statusCode
        self.message = String(data: data, encoding: .utf8)
        self.errorData = data
    }
}
