//
//  TransactionListRequest.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

struct TransactionListRequest: RequestProtocol {
    typealias Response = TransactionResponse
    typealias Error = ErrorResponse
    
    var path: String {
        "/transactions"
    }
}
