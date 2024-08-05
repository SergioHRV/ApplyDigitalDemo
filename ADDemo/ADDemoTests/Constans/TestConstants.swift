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
    
}
