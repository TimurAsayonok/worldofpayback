//
//  HeadersRequestDecorator.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

protocol HeadersRequestDecoratorProtocol {
    var requestHeaders: [String: String?] { get }
    func decorate(urlRequest: inout URLRequest)
}

// MARK: HeadersRequestDecorator
// Contains methods for decorating HTTP header like BearerToken
class HeadersRequestDecorator: HeadersRequestDecoratorProtocol {
    var requestHeaders: [String: String?] {
        // We need to change Token for Bearer in the feature!
        [HeaderRequestKey.xAuthorization.rawValue: "Token"]
    }
    
    /// Adds headers for the `urlRequest` from requestHeaders
    func decorate(urlRequest: inout URLRequest) {
        requestHeaders.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
}

enum HeaderRequestKey: String {
    case xAuthorization = "Authorization"
}
