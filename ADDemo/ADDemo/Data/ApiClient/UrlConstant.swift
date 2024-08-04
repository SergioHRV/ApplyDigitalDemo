//
//  UrlConstant.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

private let baseURL: String = {
    let url: String = "https://hn.algolia.com"
    return url
}()

enum UrlConstant {
    case articleList
    
    private var endPoint: String {
        switch self {
        case .articleList:
            return "\(baseURL)/api/v1/search_by_date?query=mobile"
        }
    }
    
    var url: String {
        self.endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
