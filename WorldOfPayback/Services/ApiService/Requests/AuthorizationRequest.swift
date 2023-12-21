//
//  AuthorizationRequest.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/21/23.
//

struct AuthorizationRequest: RequestProtocol {
    typealias Response = AuthorizationResponse
    typealias Error = ErrorResponse
    
    var path: String {
        "/v1/tokens"
    }
    
    let username: String
    let password: String
    
    init() {
        self.username = "tesonet1"
        self.password = "partyanimal"
    }
}

extension AuthorizationRequest {
    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
}

struct AuthorizationResponse: Codable, Equatable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}
