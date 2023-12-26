//
//  TransactionListRequestTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class TransactionListRequestTests: XCTestCase {
    var sut: TransactionListRequest!
    
    override func setUp() {
        super.setUp()
        
        sut = TransactionListRequest()
    }
    
    func testMustInit() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.path, "/transactions")
    }
    
    func testMustHaveCorrectResponse() {
        XCTAssertEqual("\(type(of: sut).Response.self)", "\([TransactionModel].self)")
    }
    
    func testMustHaveCorrectError() {
        XCTAssertEqual("\(type(of: sut).Error.self)", "\(ErrorResponse.self)")
    }
}
