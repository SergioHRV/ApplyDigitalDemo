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
    func testGetArticles() async throws {
        // Given
        try await persistence.deleteAllArticles()
        try await persistence.saveBatchArticles(from: TestConstants.articles)
        var expectedArticles: [Article]
        
        // When
        expectedArticles = try await sut.getArticles()
        
        // Then
        XCTAssert(expectedArticles.count == 3)
    }

    func testGetDeletedId() async throws {
        // Given
        try await persistence.deleteAllIds()
        try await persistence.saveArticleId(articleId: TestConstants.deletedIds.first!)
        var expedtedIds: [String]
        
        // When
        expedtedIds = try await sut.getDeletedArticlesIds()
        
        // Then
        XCTAssert(expedtedIds.count == 1)
    }
    
    func testSaveArticles() async throws {
        // Given
        try await persistence.deleteAllArticles()
        let articlesToSave = TestConstants.articles
        
        // When
        try await sut.saveArticles(articlesToSave)
        
        // Then
        let expedtedArticles = try await sut.getArticles()
        XCTAssert(expedtedArticles.count == 3)
    }
    
    func testAddDeletedArticleId() async throws {
        // Given
        try await persistence.deleteAllIds()
        let idToSave = TestConstants.deletedIds.first!
        
        // When
        try await sut.addDeletedArticleId(idToSave)
        
        // Then
        let expedtedIds = try await sut.getDeletedArticlesIds()
        XCTAssert(expedtedIds.count == 1)
    }
}
