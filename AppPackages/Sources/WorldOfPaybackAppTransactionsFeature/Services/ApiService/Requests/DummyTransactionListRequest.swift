//
//  DummyTransactionListRequest.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation
import WorldOfPaybackAppCore
import WorldOfPaybackAppModels

public struct DummyTransactionListRequest: RequestProtocol {
    public typealias Response = [TransactionModel]
    public typealias Error = ErrorResponse
    
    public var path: String {
        "/"
    }
    
    public init() {}
}
