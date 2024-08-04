//
//  ArticleResponse+Mapping.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

extension ArticleResponse {
    
    func toDomain() -> Article {
        
        return .init(id: id,
                     title: title,
                     author: author,
                     createdAt: dateFormatter.date(from: createdAt) ?? Date(),
                     articleUrl: articleUrl ?? "")
    }
}

// MARK: - Private
//"2024-08-03T23:36:19Z"

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()
