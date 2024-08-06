//
//  SaveDeletedArticleIdUseCaseTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 5/08/24.
//

import XCTest
@testable import ADDemo

final class SaveDeletedArticleIdUseCaseTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: DefaultSaveDeletedArticleIdUseCase!
    var repository: DomainLocalRespositorySpy!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        repository = DomainLocalRespositorySpy()
        sut = DefaultSaveDeletedArticleIdUseCase(repositry: repository)
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testCallTheRepositotyToAddAnArticleIdToDelete() {
        // Given
        let articleIdToAdd = TestConstants.deletedIds.first!
        let expectation = self.expectation(description: "SaveDeletedArticleIdUseCase")
        var articleIdAdded: String?
        repository.addDeletedArticleIdCallBack = { articleId in
            articleIdAdded = articleId
            expectation.fulfill()
        }
        
        // When
        sut.addDeletedArticleId(articleIdToAdd)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(articleIdAdded)
    }
}
