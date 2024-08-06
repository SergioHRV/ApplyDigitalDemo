//
//  GetLocalArticlesUseCaseTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class GetLocalArticlesUseCaseTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultGetLocalArticlesUseCase!
    var repository: DomainLocalRespositorySpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        repository = DomainLocalRespositorySpy()
        sut = DefaultGetLocalArticlesUseCase(repositry: repository)
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallRepositoryToGetLocalArticles() async throws {
        // Given
        var expectedArticles: [Article]
    
        // When
        expectedArticles = try await sut.getLocalArticles()
        
        // Then
        XCTAssert(expectedArticles.count == 1)
        XCTAssertTrue(repository.getDeletedArticlesIdsGotCalled)
        XCTAssertTrue(repository.getArticlesGotCalled)
    }

}
