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
    
    func getFormattedBookingData() -> String? {
        print(bookingDate)
        return bookingDate?.formatted(date: .numeric, time: .shortened)
    }
}

extension TransactionDetail {
    enum CodingKeys: String, CodingKey {
        case description
        case bookingDate
        case value
    }
}
