//
//  DummyTransactionListRequest.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation

struct DummyTransactionListRequest: RequestProtocol {
    typealias Response = [TransactionModel]
    typealias Error = ErrorResponse
    
    var path: String {
        "/"
    }
}
