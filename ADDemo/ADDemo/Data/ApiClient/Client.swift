//
//  Client.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

protocol APIClient {
    func request<T: Codable>(endpoint: APIEndpoint) async throws -> T 
}

final class Client: APIClient {
    
    private let session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
    }
    
    func request<T>(endpoint: APIEndpoint) async throws -> T where T : Decodable, T : Encodable {
        guard let url = URL(string:endpoint.path) else {
          throw HTTPStatusCode.notFound
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw HTTPStatusCode.badRequest
        }
        
        if let status = response.status, status != .ok {
            throw status
        }
        
        do {
            let objectResponse = try JSONDecoder().decode(T.self, from: data)
            return objectResponse
        } catch {
            throw CodableError.DecodingFailed
        }
    }
}
