//
//  ArticleExtensionTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 6/08/24.
//

import XCTest
@testable import ADDemo

final class ArticleExtensionTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: Article!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = Article(id: "ADDEMO04",
                      title: "ADDEMO as a testing prject",
                      author: "SRamirez",
                      createdAt: Date(),
                      articleUrl: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testArticleIsIdentifiable() {
        // Given
        var otherArticle = TestConstants.articles.first!
        
        // When
        let isEqueal = sut == otherArticle
        
        // Then
        XCTAssertTrue(isEqueal)
    }

}
