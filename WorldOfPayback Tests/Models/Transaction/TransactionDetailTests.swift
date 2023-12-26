//
//  TransactionDetailTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionDetailTests: XCTestCase {
    func testAllValues() {
        let testDate = Date()
        let sut = TransactionDetail.sut(date: testDate)
        
        XCTAssertEqual(sut.description, "description")
        XCTAssertEqual(sut.bookingDate, testDate)
        XCTAssertEqual(sut.value, TransactionValue.sut)
    }
}

extension TransactionDetail {
    static func sut(date: Date) -> Self {
        .init(
            description: "description",
            bookingDate: date,
            value: TransactionValue.sut
        )
    }
}
