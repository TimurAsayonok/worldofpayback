//
//  ParametersEncoder.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

protocol ParametersEncoder {
    func encode(_ urlRequest: URLRequest, with parameters: [String: Any]?) throws -> URLRequest
}

struct URLParametersEncoder: ParametersEncoder {
    
    /// Encode  urlRequest in case of GET, DELETE
    func encode(_ urlRequest: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
        var urlRequest = urlRequest
        
        // set urlRequest value
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue(
                "application/x-www-form-urlencoded; charset=utf-8",
                forHTTPHeaderField: "Content-Type"
            )
        }
        
        return urlRequest
    }
}

struct JsonParametersEncoder: ParametersEncoder {
    
    /// Encodes parameters in the urlRequest in case of POST, PUT
    func encode(_ urlRequest: URLRequest, with parameters: [String: Any]?) throws -> URLRequest {
        var urlRequest = urlRequest
        
        // return urlRequest if parameters == nil
        guard let parameters else { return urlRequest }
        
        let data = try JSONSerialization.data(withJSONObject: parameters)
        
        // set urlRequest value
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // set urlRequest body
        urlRequest.httpBody = data
        
        return urlRequest
    }
}

extension URLParametersEncoder {
    enum Error: Swift.Error {
        case badUrlComponents
    }
}
