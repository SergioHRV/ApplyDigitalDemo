//
//  SaveDeletedArticleIdUseCase.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

protocol SaveDeletedArticleIdUseCase {
    func addDeletedArticleId(_ articleId: String) async throws
}

final class DefaultSaveDeletedArticleIdUseCase : SaveDeletedArticleIdUseCase {
    
    private let repositry: LocalArticleRepository
    
    public init(repositry: LocalArticleRepository){
        self.repositry = repositry
    }
    
    func addDeletedArticleId(_ articleId: String) async throws {
        try await repositry.addDeletedArticleId(articleId)
    }
}
