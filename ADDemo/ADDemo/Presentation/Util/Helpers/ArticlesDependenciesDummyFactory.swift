//
//  ArticlesDependenciesDummyFactory.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class ArticlesDependenciesDummyFactory {
    
    func factory() -> ArticlesViewModel.Dependencies {
        let respository = DummyArticleRepository()
        let getArticles = DefaultGetArticlesUseCase(repositry: respository)
        let getLocalArticles = DefaultGetLocalArticlesUseCase(repositry: respository)
        let saveArticles = DefaultSaveLocalArticlesUseCase(repositry: respository)
        let monitor = DummyNetworkMonitor()
        let dependencies = ArticlesViewModel.Dependencies(getArticlesUseCase: getArticles,
                                                          getLocalArticlesUseCase: getLocalArticles,
                                                          saveArticlesUseCase: saveArticles,
                                                          networkMonitor: monitor)
        return dependencies
    }
}

final class DummyArticleRepository: ArticleRepository, LocalArticleRepository {
    func getArticles() -> [Article] {
        return dummyArticles()
    }
    
    func saveArticles(_ articles: [Article]) {}
    
    func getDeletedArticlesIds() -> [String] { [] }
    
    func getArticles() async throws -> [Article] {
        return dummyArticles()
    }
    
    private func dummyArticles() -> [Article] {
        var articles: [Article] = []
        for i in 1...3 {
            let article = Article(id: String(i), title: "title \(i)", author: "author \(i)", createdAt: Date(), articleUrl: "")
            articles.append(article)
        }
        return articles
    }
}

final class DummyNetworkMonitor: NetworkMonitor {
    var isConnected = true
}
