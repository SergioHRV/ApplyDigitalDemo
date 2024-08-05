//
//  DefaultLocalArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class DefaultLocalArticleRepository: LocalArticleRepository {
    
    let persistence: PersistenceController

    init(persistenceController: PersistenceController = PersistenceController.shared) {
        persistence = persistenceController
    }
    
    func getArticles() -> [Article] {
        let localArticles = ArticleLocalEntity.sortedFetchRequest(using: persistence.container.viewContext)
        var articles: [Article] = []
        for localArticle in localArticles {
            articles.append(localArticle.toDomain())
        }
        return articles
    }
    
    func saveArticles(_ articles: [Article]) {
        do {
            try ArticleLocalEntity.deleteAll(using: persistence.container.viewContext)
            ArticleLocalEntity.saveArticles(articles: articles, using: persistence.container.viewContext)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addDeletedArticleId(_ articleId: String) {
        DeleteArticleIDLocalEntity.saveArticleId(articleId: articleId, using: persistence.container.viewContext)
    }
    
    func getDeletedArticlesIds() -> [String] {
        let deleteArticlesIDsLocalEntitys = DeleteArticleIDLocalEntity.basicFetchRequest(using: persistence.container.viewContext)
        let deletedIds = deleteArticlesIDsLocalEntitys.map { $0.id ?? "" }
        return deletedIds
    }
}
