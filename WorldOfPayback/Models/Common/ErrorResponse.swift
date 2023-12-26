//
//  ErrorResponse.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

struct ErrorResponse: Codable, Equatable, Error, LocalizedError {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
    
    var errorDescription: String? {
        "We have error with message: \(message)"
    }
}
