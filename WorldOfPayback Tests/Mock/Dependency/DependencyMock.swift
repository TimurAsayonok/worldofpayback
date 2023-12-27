//
//  DependencyMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation
import WorldOfPaybackModels

extension ApiServiceKey {
    static var testValue: (_ throwError: Bool) -> any ApiServiceProtocol {
        return { throwError in
            throwError ? ApiServiceFailMock() : ApiServiceMock()
        }
    }
}

struct ApiServiceMock: ApiServiceProtocol {
    func getTransactionList() async throws -> [TransactionModel] {
        [TransactionModel.sut()]
    }
}

struct ApiServiceFailMock: ApiServiceProtocol {
    func getTransactionList() async throws -> [TransactionModel] {
        throw ErrorResponse.sut
    }
}
