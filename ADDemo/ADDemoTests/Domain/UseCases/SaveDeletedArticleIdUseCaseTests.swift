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
    func testCallTheRepositotyToAddAnArticleIdToDelete() async throws {
        // Given
        let articleIdToAdd = TestConstants.deletedIds.first!
        
        // When
        try await sut.addDeletedArticleId(articleIdToAdd)
        
        // Then
        XCTAssertTrue(repository.addDeletedArticleIdGotCalled)
    }
}
