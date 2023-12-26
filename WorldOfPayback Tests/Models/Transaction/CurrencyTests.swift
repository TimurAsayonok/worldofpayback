//
//  CurrencyTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class CurrencyTests: XCTestCase {
    func testCurrency() {
        let sut: Currency = .PBP
        
        XCTAssertEqual(sut, .PBP)
    }
}
