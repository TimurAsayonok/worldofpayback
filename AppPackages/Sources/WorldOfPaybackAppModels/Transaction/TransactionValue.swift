//
//  TransactionValue.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

public struct TransactionValue: Codable, Equatable, Hashable {
    public var amount: Int?
    public var currency: Currency?
    
    public var formattedValue: String {
        "\(amount ?? 0) \(currency?.rawValue ?? "")"
    }
    
    public init(amount: Int? = nil, currency: Currency? = nil) {
        self.amount = amount
        self.currency = currency
    }
    
    enum CodingKeys: String, CodingKey {
        case amount
        case currency
    }
}

#if DEBUG
public extension TransactionValue {
    static var sut: Self {
        .init(amount: 1, currency: .PBP)
    }
}
#endif
