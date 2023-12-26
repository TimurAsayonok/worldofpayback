//
//  TransactionDetailsTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionDetailsTests: XCTestCase {
    func testAllValues() {
        let testDate = Date()
        let sut = TransactionDetail.sut(date: testDate)
        
        XCTAssertEqual(sut.description, "description")
        XCTAssertEqual(sut.bookingDate, testDate)
        XCTAssertEqual(sut.value, .sut)
    }
}

extension TransactionDetail {
    static func sut(date: Date) -> Self {
        .init(
            description: "description",
            bookingDate: date,
            value: .sut
        )
    }
}

struct TransactionDetail: Codable, Equatable, Hashable {
    var description: String?
    var bookingDate: Date?
    var value: TransactionValue?
}
