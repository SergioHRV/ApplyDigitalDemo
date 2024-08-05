//
//  BaseRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

class BaseRepository {
    let client: APIClient
    init(client: APIClient = Client()) {
        self.client = client
    }
}
