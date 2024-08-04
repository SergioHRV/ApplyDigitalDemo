//
//  ArticleResponse.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

struct ArticlesResponse: Codable {
    let hits: [ArticleResponse]
}

struct ArticleResponse: Codable {
    let id: String
    let title: String?
    let otherTitle: String?
    let author: String?
    let createdAt: String?
    let articleUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case title = "story_title"
        case otherTitle = "title"
        case author = "author"
        case createdAt = "created_at"
        case articleUrl = "story_url"
    }
}
