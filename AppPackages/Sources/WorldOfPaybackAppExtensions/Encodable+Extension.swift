//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

public extension Encodable {
    func toData(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try jsonEncoder.encode(self)
    }
}
