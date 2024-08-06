//
//  DomainRespositorySpy.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import Foundation
@testable import ADDemo

final class DomainLocalRespositorySpy: LocalArticleRepository {
    var addDeletedArticleIdCallBack: (String) -> Void = { _ in }
    var saveArticlesCallBack: ([Article]) -> Void = { _ in }
    var getArticlesCallBack: ([Article]) -> Void = { _ in }
    
    func getArticles() -> [ADDemo.Article] {
        getArticlesCallBack(TestConstants.articles)
        return TestConstants.articles
    }
    
    func saveArticles(_ articles: [ADDemo.Article]) {
        saveArticlesCallBack(articles)
    }
    
    func addDeletedArticleId(_ articleId: String) {
        addDeletedArticleIdCallBack(articleId)
    }
    
    func getDeletedArticlesIds() -> [String] {
        return TestConstants.deletedIds
    }
    
    
}

final class DomainRespositorySpy: ArticleRepository {
    func getArticles() async throws -> [ADDemo.Article] {
        return TestConstants.articles
    }
}
