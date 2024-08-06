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
    var client: DataClientSpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        client = DataClientSpy()
        sut = DefaultArticleRepository(client: client)
    }
    
    override func tearDown() {
        client = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallClientToGetArticles() async throws {
        // Given
        var expectedArticles: [Article]
        
        // When
        expectedArticles = try await sut.getArticles()
        
        // Then
        XCTAssert(expectedArticles.count == 3)
        XCTAssertTrue(client.clientGotCalled)
    }

}
