//
//  TransactionAliasTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest
import WorldOfPaybackModels

final class TransactionAliasTests: XCTestCase {
    func testAllValues() {
        let sut = TransactionAlias(reference: "reference")
        
        XCTAssertEqual(sut.reference, "reference")
    }
}
