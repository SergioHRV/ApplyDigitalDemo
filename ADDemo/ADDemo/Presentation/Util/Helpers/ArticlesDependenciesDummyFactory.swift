//
//  ArticlesDependenciesDummyFactory.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class ArticlesDependenciesDummyFactory {
    
    func factory(isConnected: Bool = true) -> ArticlesViewModel.Dependencies {
        let respository = DummyArticleRepository()
        let localRespository = DummyLocalArticleRepository()
        let getArticles = DefaultGetArticlesUseCase(repository: respository, localRepository: localRespository)
        let getLocalArticles = DefaultGetLocalArticlesUseCase(repositry: localRespository)
        let saveArticles = DefaultSaveLocalArticlesUseCase(repositry: localRespository)
        let deleteArticles = DefaultSaveDeletedArticleIdUseCase(repositry: localRespository)
        let monitor = DummyNetworkMonitor(isConnected: isConnected)
        let dependencies = ArticlesViewModel.Dependencies(getArticlesUseCase: getArticles,
                                                          getLocalArticlesUseCase: getLocalArticles,
                                                          saveArticlesUseCase: saveArticles, 
                                                          saveDeletedArticleIdUseCase: deleteArticles,
                                                          networkMonitor: monitor)
        return dependencies
    }
}

final class DummyLocalArticleRepository: LocalArticleRepository {
    var getArticlesCalled: Bool = false
    
    func getArticles() async throws -> [Article] {
        getArticlesCalled = true
        return dummyArticles()
    }
    
    func saveArticles(_ articles: [Article]) async throws {}
    func addDeletedArticleId(_ articleId: String) async throws {}
    func getDeletedArticlesIds() async throws -> [String] { [] }
    
    private func dummyArticles() -> [Article] {
        var articles: [Article] = []
        for i in 1...3 {
            let article = Article(id: String(i), title: "title \(i)", author: "author \(i)", createdAt: Date(), articleUrl: "")
            articles.append(article)
        }
        return articles
    }
}

final class DummyArticleRepository: ArticleRepository {
    func getArticles() async throws -> [Article] {
        return dummyArticles()
    }
}

final class DummyNetworkMonitor: NetworkMonitor {
    var isConnected = true
    
    init(isConnected: Bool) {
        self.isConnected = isConnected
    }
}

fileprivate func dummyArticles() -> [Article] {
    var articles: [Article] = []
    for i in 1...3 {
        let article = Article(id: String(i), title: "title \(i)", author: "author \(i)", createdAt: Date(), articleUrl: "")
        articles.append(article)
    }
    return articles
}
