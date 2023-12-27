//
//  Created by Tsimur Asayonak on 12/26/23.
//

import WorldOfPaybackAppCore
import Foundation

// MARK: Test Request + Error
struct TestRequestMock: RequestProtocol {
    typealias Response = TestResponseMock
    typealias Error = TestErrorMock

    let string: String

    var path: String {
        "/some/complicated/path"
    }
}
