//
//  ConfigManager.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

struct ConfigManager {
    enum Key: String {
        case baseURL = "BASE_URL"
        case imageURL = "IMAGE_URL"
        case apiKey = "API_KEY"
    }
        
    private init() { }
    
    static func getValue(for key: Key) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            fatalError("\(key.rawValue) not set in plist or invalid")
        }
        return value
    }
}
