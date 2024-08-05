//
//  GetArticlesUseCase.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

protocol GetArticlesUseCase {
    func getArticles() async throws -> [Article]
}

final class DefaultGetArticlesUseCase : GetArticlesUseCase {
        
    private let repositry: ArticleRepository
    private let localRepositry: LocalArticleRepository
    
    public init(repositry: ArticleRepository, localRepositry: LocalArticleRepository){
        self.repositry = repositry
        self.localRepositry = localRepositry
    }
    
    func getArticles() async throws -> [Article] {
        let deletedIds = localRepositry.getDeletedArticlesIds()
        do {
            let articles = try await repositry.getArticles()
            return ArticleFilter.filter(articles: articles, contains: deletedIds)
        } catch {
            throw error
        }
    }
}
