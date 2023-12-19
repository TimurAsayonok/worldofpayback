//
//  Transaction.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct Transaction: Codable, Equatable {
    var partnerDisplayName: String?
    var alias: TransactionAlias?
    var category: Int?
    var transactionDetail: TransactionDetail?
    
    enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
}
