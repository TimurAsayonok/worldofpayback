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
        let sut = ErrorResponse.stub
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.message)
    }

}

extension ErrorResponse {
    static var stub: Self {
        .init(message: "error")
    }
}
