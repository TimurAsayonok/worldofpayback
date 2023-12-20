//
//  RequestProtocol.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

protocol RequestProtocol: Encodable {
    associatedtype Response: Codable
    associatedtype Error: Swift.Error & Codable
    
    var path: String { get }
}

// MARK: RequestProtocol
// Contains addition functions for working with Request
extension RequestProtocol {
    
    /// Returns JSONEncoder
    static func getJSONEncoder() -> JSONEncoder {
        JSONEncoder()
    }
    
    /// Returns JSON Decoder
    static func getJSONDecodet() -> JSONDecoder {
        JSONDecoder()
    }
    
    /// Get parameters Encoder based on method type
    func getParametersEncoder(_ method: HTTPMethod) -> ParametersEncoder {
        switch method {
        case .get, .delete: URLParametersEncoder()
        case .post, .put: JsonParametersEncoder()
        }
    }
    
    /// Build Request for the given `URL` and `HTTPMethod`
    func buildRequest(with url: URL, method: HTTPMethod) throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return try getParametersEncoder(method).encode(request, with: try toDictionary())
    }
    
    func toDictionary() throws -> [String: Any] {
        let data = try toData(jsonEncoder: Self.getJSONEncoder())
        let anySerialized = try JSONSerialization.jsonObject(with: data)
        
        guard let dictionary = anySerialized as? [String: Any] else {
            throw RequestProtocolError.wrongSerialization
        }
        
        return dictionary
    }
}

enum RequestProtocolError: Swift.Error {
    case wrongSerialization
}
