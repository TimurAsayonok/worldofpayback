//
//  TransactionModelTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionModelTests: XCTestCase {
    func testAllValues() {
        let sut = TransactionModel.sut(date: Date())
        
        XCTAssertEqual(sut.partnerDisplayName, "partnerDisplayName")
        XCTAssertEqual(sut.alias?.reference, "reference")
        XCTAssertEqual(sut.category, 1)
        XCTAssertNotNil(sut.transactionDetail)
    }
}


extension TransactionModel {
    static func sut(date: Date) -> Self {
        .init(
            partnerDisplayName: "partnerDisplayName",
            alias: .init(reference: "reference"),
            category: 1,
            transactionDetail: TransactionDetail.sut(date: date)
        )
    }
}
