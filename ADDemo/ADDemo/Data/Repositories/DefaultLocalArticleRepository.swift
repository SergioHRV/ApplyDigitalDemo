//
//  DefaultLocalArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class DefaultLocalArticleRepository: BaseLocalRepository, LocalArticleRepository {
    
    func getArticles() async throws -> [Article] {
        let localArticles = try await persistence.getAllArticles()
        var articles: [Article] = []
        for localArticle in localArticles {
            articles.append(localArticle.toDomain())
        }
        return articles
    }
    
    func saveArticles(_ articles: [Article]) async throws {
        try await persistence.deleteAllArticles()
        try await persistence.saveBatchArticles(from: articles)
    }
    
    func addDeletedArticleId(_ articleId: String) async throws {
        try await persistence.saveArticleId(articleId: articleId)
    }
    
    func getDeletedArticlesIds() async throws -> [String] {
        let deleteArticlesIDsLocalEntitys = try await persistence.getDeletedArticleIds()
        let deletedIds = deleteArticlesIDsLocalEntitys.map { $0.id ?? "" }
        return deletedIds
    }
}
