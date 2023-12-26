//
//  TransactionResponseTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionResponseTests: XCTestCase {
    func testAllValues() {
        let tasteDate = Date()
        let sut = TransactionResponse.sut(date: tasteDate)
        
        XCTAssertNotNil(sut.items)
        XCTAssertEqual(sut.items?.count, 2)
        
        sut.items?.forEach({
            XCTAssertEqual($0, TransactionModel.sut(date: tasteDate))
        })
    }
}

extension TransactionResponse {
    static func sut(date: Date) -> Self {
        .init(
            items: [.sut(date: date), .sut(date: date)]
        )
    }
}

