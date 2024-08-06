//
//  SaveLocalArticlesUseCaseTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class SaveLocalArticlesUseCaseTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultSaveLocalArticlesUseCase!
    var repository: DomainLocalRespositorySpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        repository = DomainLocalRespositorySpy()
        sut = DefaultSaveLocalArticlesUseCase(repositry: repository)
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallRepositoryToSaveArticles() async throws {
        // Given
        let articlesToSave = TestConstants.articles
        
        // When
        try await sut.saveArticles(articlesToSave)
        
        // Then
        XCTAssertTrue(repository.saveArticlesGotCalled)
    }

}
