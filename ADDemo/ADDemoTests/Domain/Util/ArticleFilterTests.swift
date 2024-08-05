//
//  ArticleFilterTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class ArticleFilterTests: XCTestCase {

    // MARK: Subject under test -> ArticleFilter
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Tests
    
    func testFilterArticles() {
        // Given
        let articles = TestConstants.articles
        let ids = TestConstants.deletedIds
        
        // When
        let filterArticles = ArticleFilter.filter(articles: articles, contains: ids)
        
        // Then
        XCTAssert(filterArticles.count == 1)
    }
}
