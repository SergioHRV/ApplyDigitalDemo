//
//  GetArticlesUseCaseDummyFactory.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class GetArticlesUseCaseDummyFactory {
    
    func factoryPreviewUseCase() -> GetArticlesUseCase {
        let respository = DummyArticleRepository()
        let useCase = DefaultGetArticlesUseCase(repositry: respository)
        return useCase
    }
}

final class DummyArticleRepository: ArticleRepository {
    func getArticles() async throws -> [Article] {
        var articles: [Article] = []
        for i in 1...3 {
            let article = Article(id: String(i), title: "title \(i)", author: "author \(i)", createdAt: Date(), articleUrl: "")
            articles.append(article)
        }
        return articles
    }
}

