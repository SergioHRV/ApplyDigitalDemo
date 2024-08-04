//
//  LocalArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

protocol LocalArticleRepository {
    func getArticles() -> [Article]
    func saveArticles(_ articles: [Article])
    func getDeletedArticlesIds() -> [String]
}
