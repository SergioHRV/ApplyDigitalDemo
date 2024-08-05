//
//  Article+Extesion.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import Foundation

extension Article: Hashable, Identifiable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
