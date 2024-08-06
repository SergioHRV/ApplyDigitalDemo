//
//  Article+BatchInsertable.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 6/08/24.
//

import Foundation

protocol BatchInsertable {
    var dictionaryValue: [String: Any] { get }
}

extension Article: BatchInsertable {
    
    var dictionaryValue: [String: Any] {
        [
            "id": id as Any,
            "title": title as Any,
            "author": author as Any,
            "createdAt": createdAt as Any,
            "url": articleUrl as Any
        ]
    }
}
