//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation

#if DEBUG
public struct TestErrorMock: Error, Equatable, Codable {
    public let error: String

    public init(error: String = "error") {
        self.error = error
    }
}
#endif
