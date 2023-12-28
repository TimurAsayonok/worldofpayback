//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation

#if DEBUG
public struct TestRequestMock: RequestProtocol {
    public typealias Response = TestResponseMock
    public typealias Error = TestErrorMock

    public let string: String

    public var path: String {
        "/some/complicated/path"
    }
    
    public init(string: String) {
        self.string = string
    }
}
#endif
