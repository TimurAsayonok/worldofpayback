//
//  DependencyMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation

extension ApiServiceKey {
    static var testValue: any ApiServiceProtocol = ApiServiceMock()
}

struct ApiServiceMock: ApiServiceProtocol {
    func getTransactionList() async throws -> [TransactionModel] {
        [TransactionModel.sut()]
    }
}
