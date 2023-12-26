//
//  HeadersRequestDecoratorTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class HeadersRequestDecoratorTests: XCTestCase {
    var sut: HeadersRequestDecorator!
    
    override func setUp() {
        super.setUp()
        
        sut = HeadersRequestDecorator()
    }
    
    func testInit() {
        XCTAssertNotNil(sut)
    }
    
    func testMustDecorateWithHeaders() {
        let url = URL.mock
        var urlRequest = URLRequest(url: url)
        
        XCTAssertNil(urlRequest.allHTTPHeaderFields)
        
        sut.decorate(urlRequest: &urlRequest)
        
        let headers = urlRequest.allHTTPHeaderFields
        if let headers {
            XCTAssertEqual(Array(headers.keys), [HeaderRequestKey.xAuthorization.rawValue])
            XCTAssertEqual(headers[HeaderRequestKey.xAuthorization.rawValue], "Token")
        }
    }
}
