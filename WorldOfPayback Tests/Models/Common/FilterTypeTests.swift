//
//  FilterTypeTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class FilterTypeTests: XCTestCase {
    func testDateDescending() {
        let stub: FilterType = .byDate(.descending)
        
        XCTAssertEqual(stub, .byDate(.descending))
    }
    
    func testDateAscending() {
        let stub: FilterType = .byDate(.ascending)
        
        XCTAssertEqual(stub, .byDate(.ascending))
    }
    
    func testCategory() {
        let stub: FilterType = .category(1)
        
        XCTAssertEqual(stub, .category(1))
    }
}
