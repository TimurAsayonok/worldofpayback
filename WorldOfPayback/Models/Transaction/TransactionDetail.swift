//
//  TransactionDetail.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionDetail: Codable, Equatable, Hashable {
    var description: String?
    var bookingDate: Date?
    var value: TransactionValue?
    
    init(description: String? = nil, bookingDate: Date? = nil, value: TransactionValue? = nil) {
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
