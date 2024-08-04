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
    
    public init(repositry: ArticleRepository){
        self.repositry = repositry
    }
    
    func getArticles() async throws -> [Article] {
        do {
            let articles = try await repositry.getArticles()
            return articles
        } catch {
            throw error
        }
    }
}
