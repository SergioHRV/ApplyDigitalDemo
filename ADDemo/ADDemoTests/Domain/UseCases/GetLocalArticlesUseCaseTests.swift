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
    func testCallRepositoryToGetLocalArticles() {
        // Given
        let expectation = self.expectation(description: "GetLocalArticlesUseCase")
        var articlesExpected: [Article]?
        repository.getArticlesCallBack = { articles in
            articlesExpected = articles
            expectation.fulfill()
        }
        
        // When
        let finalArticles = sut.getLocalArticles()
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(articlesExpected)
        XCTAssert(articlesExpected?.count == 3)
        XCTAssert(finalArticles.count == 1)
    }

}
