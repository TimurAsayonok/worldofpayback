//
//  TransactionListRequest.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation
import WorldOfPaybackAppModels
import WorldOfPaybackAppCore

public struct TransactionListRequest: RequestProtocol {
    public typealias Response = TransactionResponse
    public typealias Error = ErrorResponse
    
    public var path: String {
        "/transactions"
    }
    
    public init() {}
}
