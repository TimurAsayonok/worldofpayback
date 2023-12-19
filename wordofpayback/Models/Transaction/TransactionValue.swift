//
//  TransactionValue.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionValue: Codable, Equatable {
    var amount: Int?
    var currency: String?
    
    enum CodingKeys: String, CodingKey {
        case amount
        case currency
    }
}
