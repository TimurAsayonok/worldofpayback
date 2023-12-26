//
//  HeadersRequestDecoratorProtocolMock.swift
//  WorldOfPayback Tests
//
//  Created by Tsimur Asayonak on 12/26/23.
//

@testable import WorldOfPayback_Dev
import Foundation

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
