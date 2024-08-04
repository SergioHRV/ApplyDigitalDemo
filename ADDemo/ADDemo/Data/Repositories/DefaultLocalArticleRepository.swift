//
//  DefaultLocalArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class DefaultLocalArticleRepository: LocalArticleRepository {
    
    let persistence = PersistenceController.shared
    
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
            for article in articles {
                ArticleLocalEntity.createWith(id: article.id,
                                              title: article.title,
                                              author: article.author,
                                              createdAtDate: article.createdAt,
                                              url: article.articleUrl,
                                              using: persistence.container.viewContext)
            }
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func getDeletedArticlesIds() -> [String] {
        return []
    }
}
