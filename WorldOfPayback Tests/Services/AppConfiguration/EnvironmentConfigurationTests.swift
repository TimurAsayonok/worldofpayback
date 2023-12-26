//
//  EnvironmentConfigurationTests.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import XCTest

final class EnvironmentConfigurationTests: XCTestCase {
    func testDevelopmentEnvironment() {
        let sut: EnvironmentConfiguration = .development
        
        XCTAssertEqual(sut, EnvironmentConfiguration(rawValue: sut.rawValue))
    }
    
    func testStagingEnvironment() {
        let sut: EnvironmentConfiguration = .staging
        
        XCTAssertEqual(sut, EnvironmentConfiguration(rawValue: sut.rawValue))
    }
    
    func testProductionEnvironment() {
        let sut: EnvironmentConfiguration = .production
        
        XCTAssertEqual(sut, EnvironmentConfiguration(rawValue: sut.rawValue))
    }
}
