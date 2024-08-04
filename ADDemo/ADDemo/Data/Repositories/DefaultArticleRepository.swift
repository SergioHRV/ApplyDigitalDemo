//
//  DefaultArticleRepository.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

final class DefaultArticleRepository: BaseRepository, ArticleRepository {
    
    func getArticles() async throws -> [Article] {
        let endpoint = APIEndpoint(path: UrlConstant.articleList.url)
        let articlesResponse: ArticlesResponse = try await client.request(endpoint: endpoint)
        
        var articles: [Article] = []
        for articleResponse in articlesResponse.hits {
            articles.append(articleResponse.toDomain())
        }
        return articles
    }
}
