//
//  BaseLocalRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 7/08/24.
//

import Foundation

class BaseLocalRepository {
    let persistence: PersistenceController

    init(persistenceController: PersistenceController = PersistenceController.shared) {
        persistence = persistenceController
    }
}
