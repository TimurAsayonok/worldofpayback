//
//  TransactionDetail.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

public struct TransactionDetail: Codable, Equatable, Hashable {
    public var description: String?
    public var bookingDate: Date?
    public var value: TransactionValue?
    
    public init(
        description: String? = nil,
        bookingDate: Date? = nil,
        value: TransactionValue? = nil
    ) {
        self.description = description
        self.bookingDate = bookingDate
        self.value = value
    }
}

extension TransactionDetail {
    enum CodingKeys: String, CodingKey {
        case description
        case bookingDate
        case value
    }
}
