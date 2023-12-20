//
//  ApiService.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

// MARK: ApiService
// Contains api service methods
protocol ApiServiceProtocol {
    func getTransactionList() async throws -> [TransactionModel]
}

class ApiService: ApiServiceProtocol {
    private var apiProvider: ApiProviderProtocol
    
    init(apiProvider: ApiProviderProtocol) {
        self.apiProvider = apiProvider
    }
    
    func getTransactionList() async throws -> [TransactionModel] {
        let request = TransactionListRequest()
        let response: TransactionListRequest.Response = try await apiProvider.get(apiRequest: request)
        return response
    }
}
