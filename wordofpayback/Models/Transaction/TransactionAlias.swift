//
//  TransactionAlias.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionAlias: Codable, Equatable {
    var reference: String?
    
    enum CodingKeys: String, CodingKey {
        case reference
    }
}
