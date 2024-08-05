//
//  GetLocalArticlesUseCase.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

protocol GetLocalArticlesUseCase {
    func getLocalArticles() -> [Article]
}

final class DefaultGetLocalArticlesUseCase : GetLocalArticlesUseCase {
        
    private let repositry: LocalArticleRepository
    
    public init(repositry: LocalArticleRepository){
        self.repositry = repositry
    }
    
    func getLocalArticles() -> [Article] {
        let deletedIds = repositry.getDeletedArticlesIds()
        let articles = repositry.getArticles()
        return ArticleFilter.filter(articles: articles, contains: deletedIds)
    }
}
