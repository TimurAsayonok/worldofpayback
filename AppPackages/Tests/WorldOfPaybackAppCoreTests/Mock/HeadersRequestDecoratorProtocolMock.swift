//
//  Created by Tsimur Asayonak on 12/26/23.
//

import Foundation
import WorldOfPaybackAppCore

class HeadersRequestDecoratorProtocolMock: HeadersRequestDecoratorProtocol {
    var requestHeaders: [String: String?] {
        [HeaderRequestKey.xAuthorization.rawValue: "Bearer Token"]
    }
    
    func decorate(urlRequest: inout URLRequest) {
        requestHeaders.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }    
}
