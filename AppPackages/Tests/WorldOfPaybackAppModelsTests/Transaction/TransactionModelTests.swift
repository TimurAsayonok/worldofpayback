//
//  TransactionModelTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

import XCTest
import WorldOfPaybackAppModels

final class TransactionModelTests: XCTestCase {
    func testAllValues() {
        let sut = TransactionModel.sut()
        
        XCTAssertEqual(sut.partnerDisplayName, "partnerDisplayName")
        XCTAssertEqual(sut.alias?.reference, "reference")
        XCTAssertEqual(sut.category, 1)
        XCTAssertNotNil(sut.transactionDetail)
    }
}


extension TransactionModel {
    static func sut() -> Self {
        .init(
            partnerDisplayName: "partnerDisplayName",
            alias: .init(reference: "reference"),
            category: 1,
            transactionDetail: TransactionDetail.sut()
        )
    }
}
