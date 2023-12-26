//
//  ErrorResponseTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class ErrorResponseTests: XCTestCase {
    func testMustInitWithAllValues() {
        let sut = ErrorResponse.sut
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.message)
    }

}

extension ErrorResponse {
    static var sut: Self {
        .init(message: "error")
    }
}
