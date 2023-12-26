//
//  BuildConfigurationMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation

class BuildConfigurationProtocolMock: BuildConfigurationProtocol {
    var apiBasedUrl: URL {
        URL(string: "https://api-test.payback.com")!
    }
}
