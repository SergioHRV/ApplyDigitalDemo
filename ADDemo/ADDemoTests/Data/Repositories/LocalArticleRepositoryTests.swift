//
//  LocalArticleRepositoryTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class LocalArticleRepositoryTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultLocalArticleRepository!
    var persistence: PersistenceController!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        persistence = PersistenceController.preview
        sut = DefaultLocalArticleRepository(persistenceController: persistence)
    }
    
    override func tearDown() {
        persistence = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testGetArticles() {
        // Given
        var articlesExpected: [Article]?
        sut.saveArticles(TestConstants.articles)
        
        // When
        articlesExpected = sut.getArticles()
        
        // Then
        XCTAssertNotNil(articlesExpected)
        XCTAssert(articlesExpected?.count == 3)
    }

    func testGetDeletedId() {
        // Given
        var expedtedIds: [String]?
        sut.addDeletedArticleId("TestIdToSave")
        
        // When
        expedtedIds = sut.getDeletedArticlesIds()
        
        // Then
        XCTAssertNotNil(expedtedIds)
        XCTAssert(expedtedIds?.count == 1)
    }
    
}
