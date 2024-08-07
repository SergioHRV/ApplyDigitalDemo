//
//  ArticlesDependenciesDummyFactoryTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 6/08/24.
//

import XCTest
@testable import ADDemo

final class ArticlesDependenciesDummyFactoryTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: ArticlesDependenciesDummyFactory!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut = ArticlesDependenciesDummyFactory()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testFactoryCreateDependencies() {
        // Given
        let dependencies: ArticlesViewModel.Dependencies?
        
        // When
        dependencies = sut.factory()
        
        // Then
        XCTAssertNotNil(dependencies)
    }

}
