//
//  ApiService.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

// MARK: ApiService
// Contains api service methods

struct ApiService {
    private var apiProvider: ApiProviderProtocol
    
    init(apiProvider: ApiProviderProtocol) {
        self.apiProvider = apiProvider
    }
    
    func getTransactionList() async throws -> [TransactionModel] {
        // Sleep for 5 seconds jus for testing
        try await Task.sleep(until: .now + .seconds(5), clock: .continuous)
        
        let randomNumber = Int.random(in: 1...9)
        if randomNumber % 2 == 0 {
            return try await getDummyTransactionList()
        }
        
        let request = TransactionListRequest()
        let response: TransactionListRequest.Response = try await apiProvider.get(apiRequest: request)
        return response
    }
    
    func getDummyTransactionList() async throws -> [TransactionModel] {
        let dummyRequest = DummyTransactionListRequest()
        return try await apiProvider.getDummyItems(apiRequest: dummyRequest)
    }
}
