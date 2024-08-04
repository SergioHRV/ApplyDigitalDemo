//
//  ArticleResponse+Mapping.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

extension ArticleResponse {
    
    private var dateFormatter: DateFormatter {
        //"2024-08-03T23:36:19Z"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }

    func toDomain() -> Article {
        let date = dateFormatter.date(from: createdAt) ?? Date()
        let article = Article(id: id,
                              title: title,
                              author: author,
                              createdAt: date,
                              articleUrl: articleUrl ?? "")
        return article
    }
}

