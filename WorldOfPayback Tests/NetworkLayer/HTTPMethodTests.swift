//
//  HTTPMethodTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class HTTPMethodTests: XCTestCase {
    func testAllCase() {
        let sut: [HTTPMethod] = [.get, .post, .put, .delete]
        
        sut.forEach {
            XCTAssertEqual($0, HTTPMethod(rawValue: $0.rawValue))
        }
    }
}
