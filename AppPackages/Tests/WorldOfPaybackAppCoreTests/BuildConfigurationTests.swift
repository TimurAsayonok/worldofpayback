//
//  BuildConfigurationTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

import XCTest

final class BuildConfigurationTests: XCTestCase {
    var sut = BuildConfigurationProtocolMock()
    
    func testApiBasesUrl() {
        XCTAssertEqual(sut.apiBasedUrl, URL(string: "https://api-test.payback.com"))
    }
}
