//
//  APIEndpoint.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

// MARK: Defines
typealias Parameters = [String: Any]
typealias Headers = [String: String]
typealias Path = String

enum Method {
    case get, post, put, patch, delete
    
    var methodValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

// MARK: Endpoint
final class APIEndpoint {
    let method: Method
    let path: Path
    let parameters: Parameters?
    var headers: Headers?

    init(method: Method = .get,
         path: Path,
         parameters: Parameters? = nil,
         headers: Headers? = [:]) {
        self.method = method
        self.path = path
        self.parameters = parameters
        self.headers = headers
    }
}
