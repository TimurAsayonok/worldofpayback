//
//  ApiProvider.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/20/23.
//

import Foundation

protocol ApiProviderProtocol {
    var basedUrl: URL { get }
    
    func send<T: RequestProtocol>(apiRequest: T, method: HTTPMethod) async throws -> T.Response
    
    /// Methods returns mocked items just for testing
    func getDummyItems<T: RequestProtocol>(apiRequest: T) async throws -> T.Response
}

// realization of the main HTTP requests
extension ApiProviderProtocol {
    func get<T: RequestProtocol>(apiRequest: T) async throws -> T.Response {
        return try await send(apiRequest: apiRequest, method: .get)
    }
    
    func post<T: RequestProtocol>(apiRequest: T) async throws -> T.Response {
        return try await send(apiRequest: apiRequest, method: .post)
    }
    
    func put<T: RequestProtocol>(apiRequest: T) async throws -> T.Response {
        return try await send(apiRequest: apiRequest, method: .put)
    }
    
    func delete<T: RequestProtocol>(apiRequest: T) async throws -> T.Response {
        return try await send(apiRequest: apiRequest, method: .delete)
    }
}

class ApiProvider: ApiProviderProtocol {
    var basedUrl: URL {
        BuildConfiguration.shared.apiBasedURL
    }
    
    /// Sends Api request to the server and returns data
    func send<T: RequestProtocol>(apiRequest: T, method: HTTPMethod) async throws -> T.Response {
        var urlRequest: URLRequest
        
        do {
            urlRequest = try apiRequest.buildRequest(with: basedUrl, method: method)
            
            // add headers decorator
        } catch {
            print("🐞", type(of: self), "->", error)
            throw error
        }
        
        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    if let urlError = error as? URLError {
                        continuation.resume(with: .failure(ErrorResponse(message: urlError.localizedDescription)))
                    } else {
                        continuation.resume(with: .failure(error))
                    }
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    do {
                        if 200..<300 ~= httpResponse.statusCode {
                            let model = try T.getJSONDecoder().decode(T.Response.self, from: data ?? Data())
                            
                            continuation.resume(with: .success(model))
                        } else {
                            let errorMessage = try T.getJSONDecoder().decode(T.Error.self, from: data ?? Data())
                            
                            continuation.resume(with: .failure(errorMessage))
                        }
                    } catch {
                        continuation.resume(with: .failure(error))
                    }
                }
            }
            
            dataTask.resume()
        }
    }
    
    /// Methods returns mocked items just for testing
    func getDummyItems<T: RequestProtocol>(apiRequest: T) async throws -> T.Response {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                let dummyData = try self.dummyResponse()
                let model = try T.getJSONDecoder().decode(TransactionResponse.self, from: dummyData)
                
                // we are using force unwrap just for testing!
                continuation.resume(with: .success(model.items as! T.Response))
            } catch {
                print("Error", error)
                continuation.resume(with: .failure(error))
            }
        }
    }
    
    private func dummyResponse() throws -> Data {
        var data = Data()
        if let path = Bundle.main.path(forResource: "PBTransactions", ofType: "json") {
            data = try Data(contentsOf: URL(filePath: path))
        }
        
        return data
    }
}
