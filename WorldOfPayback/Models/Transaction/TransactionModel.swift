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
    
    enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
    
    static func mock() -> Self {
        .init(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "795357452000810"),
            category: 1,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: Date(),
                value: TransactionValue(amount: 124, currency: .PBP)
            )
        )
    }
    
    static func mockedList() -> [Self] {
        return [
            .mock(),
            .mock(),
            .mock()
        ]
    }
}
