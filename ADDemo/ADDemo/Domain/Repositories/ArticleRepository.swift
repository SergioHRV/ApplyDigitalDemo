//
//  ArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

protocol ArticleRepository {
    func getArticles() async throws -> [Article]
}
