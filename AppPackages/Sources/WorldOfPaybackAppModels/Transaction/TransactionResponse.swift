//
//  Created by Tsimur Asayonak on 12/21/23.
//

import Foundation

public struct TransactionResponse: Codable, Equatable {
    public var items: [TransactionModel]?
    
    public init(items: [TransactionModel]? = nil) {
        self.items = items
    }
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}
