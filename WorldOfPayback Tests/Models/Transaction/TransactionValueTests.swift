//
//  TransactionValueTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionValueTests: XCTestCase {
    func testAllValues() {
        let sut = TransactionValue.sut
        
        XCTAssertEqual(sut.amount, 1)
        XCTAssertEqual(sut.currency, .PBP)
    }
    
    func testFormattedValue() {
        let sut = TransactionValue.sut
        
        XCTAssertEqual(sut.formattedValue, "1 PBP")
    }
}

extension TransactionValue {
    static var sut: Self {
        .init(amount: 1, currency: .PBP)
    }
}

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
