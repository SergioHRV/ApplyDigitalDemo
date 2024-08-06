//
//  ArticleRepositoryTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class ArticleRepositoryTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultArticleRepository!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = DefaultArticleRepository(client: DataClientSpy())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallClientToGetArticles() async throws {
        // Given
        var articlesExpected: [Article]?
        
        // When
        articlesExpected = try await sut.getArticles()
        
        // Then
        XCTAssertNotNil(articlesExpected)
        XCTAssert(articlesExpected?.count == 3)
    }

}
