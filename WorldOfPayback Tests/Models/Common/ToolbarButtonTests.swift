//
//  ToolbarButtonTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest
import SwiftUI

final class ToolbarButtonTests: XCTestCase {
    func testAllValues() {
        let testID = UUID(uuidString: "1111111")
        let stub = ToolbarButton(uuid: testID, type: .filter)
        
        XCTAssertEqual(stub.uuid, testID)
        XCTAssertEqual(stub.type, .filter)
    }
    
    func testFilterButtonType() {
        let stub = ToolbarButton(type: .filter)
        
        XCTAssertEqual(stub.type, .filter)
        XCTAssertEqual(stub.type?.getIcon(), Image(systemName: "slider.horizontal.3"))
    }
    
    func testRefreshButtonType() {
        let stub = ToolbarButton(type: .refresh)
        
        XCTAssertEqual(stub.type, .refresh)
        XCTAssertEqual(stub.type?.getIcon(), Image(systemName: "arrow.clockwise"))
    }
}
