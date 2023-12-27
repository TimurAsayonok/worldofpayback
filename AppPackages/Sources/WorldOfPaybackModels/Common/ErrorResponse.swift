//
//  ErrorResponse.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

public struct ErrorResponse: Codable, Equatable, Error, LocalizedError {
    public let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
    
    public var errorDescription: String? {
        "We have error with message: \(message)"
    }
}
