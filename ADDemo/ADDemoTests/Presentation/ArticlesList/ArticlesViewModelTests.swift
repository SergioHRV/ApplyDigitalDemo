//
//  ArticlesViewModelTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 6/08/24.
//

import XCTest
@testable import ADDemo

final class ArticlesViewModelTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: ArticlesViewModel!
    var dependencies: ArticlesViewModel.Dependencies!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        dependencies = nil
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testGetsArticlesWithConectionUpdatesArticles() async {
        // Given
        dependencies = ArticlesDependenciesDummyFactory().factory(isConnected: true)
        sut = ArticlesViewModel(dependencies: dependencies)
        
        // When
        await sut.getArticles()
        
        // Then
        XCTAssertTrue(!sut.articles.isEmpty)
    }
    
    func testGetsArticlesWithoutConectionUpdatesArticles() async {
        // Given
        dependencies = ArticlesDependenciesDummyFactory().factory(isConnected: false)
        sut = ArticlesViewModel(dependencies: dependencies)
        
        // When
        await sut.getArticles()
        
        // Then
        XCTAssertTrue(!sut.articles.isEmpty)
    }

    func testDeleteArticlesArticles() async {
        // Given
        dependencies = ArticlesDependenciesDummyFactory().factory()
        sut = ArticlesViewModel(dependencies: dependencies)
        await sut.getArticles()
        let offset = IndexSet([1])
        
        // When
        await sut.deleteArticle(at: offset)
        
        // Then
        XCTAssertTrue(sut.articles.count == 2)
    }
}
