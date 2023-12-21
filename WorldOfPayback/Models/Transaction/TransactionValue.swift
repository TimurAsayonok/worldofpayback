//
//  TransactionValue.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionValue: Codable, Equatable, Hashable {
    var amount: Int?
    var currency: Currency?
    
    var formattedValue: String {
        "\(amount ?? 0) \(currency?.rawValue ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case amount
        case currency
    }
}
