//
//  TransactionDetailTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest
import WorldOfPaybackModels

final class TransactionDetailTests: XCTestCase {
    func testAllValues() {
        let sut = TransactionDetail.sut()
        
        XCTAssertEqual(sut.description, "description")
        XCTAssertNotNil(sut.bookingDate)
        XCTAssertEqual(sut.value, TransactionValue.sut)
    }
}

extension TransactionDetail {
    static func sut() -> Self {
        let date = DateFormatter.customDateFormatter.date(from: "2023-12-26T11:42:00")
        print("Date", date)
        return .init(
            description: "description",
            bookingDate: DateFormatter.customDateFormatter.date(from: "2023-12-26T11:42:00"),
            value: TransactionValue.sut
        )
    }
}
