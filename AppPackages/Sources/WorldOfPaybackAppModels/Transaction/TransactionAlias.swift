//
//  TransactionAlias.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/19/23.
//

import Foundation

public struct TransactionAlias: Codable, Equatable, Hashable {
    public var reference: String?
    
    public init(reference: String? = nil) {
        self.reference = reference
    }
    
    enum CodingKeys: String, CodingKey {
        case reference
    }
}
