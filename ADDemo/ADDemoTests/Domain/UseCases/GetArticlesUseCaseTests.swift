//
//  GetArticlesUseCaseTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class GetArticlesUseCaseTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultGetArticlesUseCase!
    var repository: DomainRespositorySpy!
    var localRepository: DomainLocalRespositorySpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        repository = DomainRespositorySpy()
        localRepository = DomainLocalRespositorySpy()
        sut = DefaultGetArticlesUseCase(repository: repository,
                                        localRepository: localRepository)
    }
    
    override func tearDown() {
        repository = nil
        localRepository = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallRepositoryToGetArticles() async throws {
        // Given
        var expectedArticles: [Article]
        
        // When
        expectedArticles = try await sut.getArticles()
        
        // Then
        XCTAssert(expectedArticles.count == 1)
        XCTAssertTrue(localRepository.getDeletedArticlesIdsGotCalled)
        XCTAssertTrue(repository.getArticlesGotCalled)
    }

}
