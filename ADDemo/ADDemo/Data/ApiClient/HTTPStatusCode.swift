//
//  HTTPStatusCode.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

enum HTTPStatusCode: Int, Error {
    case ok = 200
    case found = 302
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
}

enum CodableError: Error {
  case DecodingFailed
}

extension HTTPURLResponse {
    var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }
}
