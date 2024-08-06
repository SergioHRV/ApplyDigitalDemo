//
//  DomainRespositorySpy.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import Foundation
@testable import ADDemo

final class DomainLocalRespositorySpy: LocalArticleRepository {
    var getArticlesGotCalled: Bool = false
    var saveArticlesGotCalled: Bool = false
    var addDeletedArticleIdGotCalled: Bool = false
    var getDeletedArticlesIdsGotCalled: Bool = false
    
    func getArticles() async throws -> [ADDemo.Article] {
        getArticlesGotCalled = true
        return TestConstants.articles
    }
    
    func saveArticles(_ articles: [ADDemo.Article]) async throws {
        saveArticlesGotCalled = true
    }
    
    func addDeletedArticleId(_ articleId: String) async throws {
        addDeletedArticleIdGotCalled = true
    }
    
    func getDeletedArticlesIds() async throws -> [String] {
        getDeletedArticlesIdsGotCalled = true
        return TestConstants.deletedIds
    }
    
    
}

final class DomainRespositorySpy: ArticleRepository {
    var getArticlesGotCalled: Bool = false
    
    func getArticles() async throws -> [ADDemo.Article] {
        getArticlesGotCalled = true
        return TestConstants.articles
    }
}
