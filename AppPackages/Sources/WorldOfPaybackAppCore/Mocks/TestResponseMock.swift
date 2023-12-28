//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation

#if DEBUG
public struct TestResponseMock: Codable, Equatable {
    public var id: String

    public init(id: String) {
        self.id = id
    }

    public static func == (lhs: TestResponseMock, rhs: TestResponseMock) -> Bool {
        lhs.id == rhs.id
    }
}
#endif
