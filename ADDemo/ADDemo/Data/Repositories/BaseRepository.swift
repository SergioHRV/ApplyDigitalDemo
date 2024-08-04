//
//  BaseRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

class BaseRepository {
    public var client: APIClient
    public init(client: APIClient = Client()) {
        self.client = client
    }
}
