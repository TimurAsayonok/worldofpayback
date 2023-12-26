//
//  Transaction.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionModel: Codable, Equatable, Hashable {
    var partnerDisplayName: String?
    var alias: TransactionAlias?
    var category: Int?
    var transactionDetail: TransactionDetail?
}

extension TransactionModel {
    enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
}
