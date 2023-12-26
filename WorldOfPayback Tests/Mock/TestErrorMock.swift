//
//  TestErrorMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation

struct TestErrorMock: Swift.Error, Equatable, Codable {
    public let error: String

    public init(error: String = "error") {
        self.error = error
    }
}
