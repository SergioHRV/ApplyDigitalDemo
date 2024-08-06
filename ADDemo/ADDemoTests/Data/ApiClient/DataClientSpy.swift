//
//  DataClientSpy.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import Foundation
@testable import ADDemo

final class DataClientSpy: APIClient {
    func request<T>(endpoint: ADDemo.APIEndpoint) async throws -> T where T : Decodable, T : Encodable {
        let response: T = TestConstants.articlesResponse as! T
        return response
    }
}
