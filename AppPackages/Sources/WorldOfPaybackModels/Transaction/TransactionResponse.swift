//
//  TransactionResponse.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation

struct TransactionResponse: Codable, Equatable {
    var items: [TransactionModel]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
