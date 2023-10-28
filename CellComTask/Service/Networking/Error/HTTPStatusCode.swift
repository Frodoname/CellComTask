//
//  HTTPStatusCode.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

enum HTTPStatusCode: Int, Error {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case unprocessableEntity = 422
    case tooManyRequests = 429
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    
    var message: String {
        switch self {
        case .badRequest:
            return "Validation failed."
        case .unauthorized:
            return "Authentication failed: You do not have permissions to access the service."
        case .forbidden:
            return "Duplicate entry: The data you tried to submit already exists."
        case .notFound:
            return "Invalid id: The pre-requisite id is invalid or not found."
        case .methodNotAllowed:
            return "Invalid format: This service doesn't exist in that format."
        case .notAcceptable:
            return "Invalid accept header."
        case .unprocessableEntity:
            return "Invalid parameters: Your request parameters are incorrect."
        case .tooManyRequests:
            return "Your request count (#) is over the allowed limit of (40)."
        case .internalServerError:
            return "Internal error: Something went wrong, contact TMDB."
        case .notImplemented:
            return "Invalid service: this service does not exist."
        case .badGateway:
            return "Couldn't connect to the backend server."
        case .serviceUnavailable:
            return "Service offline: This service is temporarily offline, try again later."
        case .gatewayTimeout:
            return "Your request to the backend server timed out. Try again."
        }
    }
}
