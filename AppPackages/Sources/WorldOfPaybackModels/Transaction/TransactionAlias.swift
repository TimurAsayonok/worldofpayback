//
//  TransactionAlias.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionAlias: Codable, Equatable, Hashable {
    var reference: String?
    
    enum CodingKeys: String, CodingKey {
        case reference
    }
}
