//
//  TransactionDetail.swift
//  wordofpayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

struct TransactionDetail: Codable, Equatable {
    var description: String?
    var bookingDate: Date?
    var value: Int?
    
    enum CodingKeys: String, CodingKey {
        case description
        case bookingDate
        case value
    }
}
