//
//  HTTPClient.swift
//  ILojaVirtual
//
//  Created by Silvanei  Martins on 22/01/25.
//
 
import Foundation

enum HTTPMETHOD: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum NetworkError: Error {
    case InvalidURL
    case invalidResponse
    case invalidData
    case invalidHTTPStatusCode
}

class HTTPClient {
    static let shared = HTTPClient()
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.httpCookieStorage = HTTPCookieStorage.shared
        return config
    }()
    
    let session: URLSession
    
    init() {
        self.session = URLSession(configuration: configuration)
    }
    
    func httpRequest<T: Decodable>(url: URL, method: HTTPMETHOD, body: Data? = nil, headers:[String: String]? = nil) async throws -> (data: T, response: HTTPURLResponse) {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // TODO: Adicionar token
        
        let (_, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return (responseData, httpResponse)
        } catch {
            throw error
        }
    }
}
