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
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = DefaultGetArticlesUseCase(repositry: DomainRespositorySpy(),
                                        localRepositry: DomainLocalRespositorySpy())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallRepositoryToGetArticles() async throws {
        // Given
        var articlesExpected: [Article]?
        
        // When
        articlesExpected = try await sut.getArticles()
        
        // Then
        XCTAssertNotNil(articlesExpected)
        XCTAssert(articlesExpected?.count == 1)
    }

}
