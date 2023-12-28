//
//  Transaction.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

public struct TransactionModel: Codable, Equatable, Hashable {
    public var partnerDisplayName: String?
    public var alias: TransactionAlias?
    public var category: Int?
    public var transactionDetail: TransactionDetail?
    
    public init(
        partnerDisplayName: String? = nil,
        alias: TransactionAlias? = nil,
        category: Int? = nil,
        transactionDetail: TransactionDetail? = nil
    ) {
        self.partnerDisplayName = partnerDisplayName
        self.alias = alias
        self.category = category
        self.transactionDetail = transactionDetail
    }
}

public extension TransactionModel {
    enum CodingKeys: String, CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }
}

#if DEBUG
public extension TransactionModel {
    static func sut() -> Self {
        .init(
            partnerDisplayName: "partnerDisplayName",
            alias: .init(reference: "reference"),
            category: 1,
            transactionDetail: TransactionDetail.sut()
        )
    }
}
#endif
