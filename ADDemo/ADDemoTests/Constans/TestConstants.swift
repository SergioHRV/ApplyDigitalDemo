//
//  TestConstants.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import Foundation
@testable import ADDemo

struct TestConstants {
    
    static let articles: [Article] = [
        Article(id: "ADDEMO01",
                title: "ADDEMO as a testing prject",
                author: "SRamirez",
                createdAt: Date(),
                articleUrl: ""),
        Article(id: "ADDEMO02",
                title: "ADDEMO as a testing prject",
                author: "SRamirez",
                createdAt: Date(),
                articleUrl: ""),
        Article(id: "ADDEMO03",
                title: "ADDEMO as a testing prject",
                author: "SRamirez",
                createdAt: Date(),
                articleUrl: "")
        
    ]
    
    static let deletedIds: [String] = [
        "ADDEMO02",
        "ADDEMO03"
    ]
    
    static let articlesResponse: ArticlesResponse = ArticlesResponse(hits: [
        ArticleResponse(id: "ADDEMO01",
                        title: "ADDEMO as a testing prject",
                        otherTitle: nil,
                        author: "SRamirez",
                        createdAt: "2024-04-03T23:36:19Z",
                        articleUrl: nil),
        ArticleResponse(id: "ADDEMO02",
                        title: "ADDEMO as a testing prject",
                        otherTitle: nil,
                        author: "SRamirez",
                        createdAt: "2024-08-04T23:36:19Z",
                        articleUrl: nil),
        ArticleResponse(id: "ADDEMO03",
                        title: nil,
                        otherTitle: "ADDEMO as a testing prject",
                        author: "SRamirez",
                        createdAt: "2024-08-04T23:36:19Z",
                        articleUrl: nil)
    ])
}
