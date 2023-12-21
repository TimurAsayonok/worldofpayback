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
        let request = TransactionListRequest()
        let response: TransactionListRequest.Response = try await apiProvider.get(apiRequest: request)
        return response
    }
    
    func postData() async throws -> String {
        let request = AuthorizationRequest()
        let response: AuthorizationRequest.Response = try await apiProvider.post(apiRequest: request)
        return response.token
    }
}
