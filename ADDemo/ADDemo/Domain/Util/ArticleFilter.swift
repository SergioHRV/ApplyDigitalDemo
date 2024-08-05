//
//  ArticleFilter.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

struct ArticleFilter {
    
    static func filter(articles: [Article], contains ids: [String]) -> [Article] {
        articles.filter { (article) -> Bool in
            ids.allSatisfy { id in
                article.id != id
            }
        }
    }
}
