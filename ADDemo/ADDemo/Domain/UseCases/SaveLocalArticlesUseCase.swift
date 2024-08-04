//
//  SaveLocalArticlesUseCase.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

protocol SaveLocalArticlesUseCase {
    func saveArticles(_ articles: [Article])
}

final class DefaultSaveLocalArticlesUseCase : SaveLocalArticlesUseCase {
    
    private let repositry: LocalArticleRepository
    
    public init(repositry: LocalArticleRepository){
        self.repositry = repositry
    }
    
    func saveArticles(_ articles: [Article]) {
        repositry.saveArticles(articles)
    }
}
