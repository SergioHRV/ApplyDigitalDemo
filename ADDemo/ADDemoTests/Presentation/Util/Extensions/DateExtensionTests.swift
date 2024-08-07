//
//  DateExtensionTests.swift
//  ADDemoTests
//
//  Created by Sergio Ramirez on 6/08/24.
//

import XCTest
@testable import ADDemo

final class DateExtensionTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: Date!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testTimeAgoGetsNow() {
        // Given
        sut = Date()
        
        // When
        let timeAgo = sut.timeAgo()
        
        // Then
        XCTAssert(timeAgo == "Now")
    }
    
    func testTimeAgoGetsYesterday() {
        // Given
        sut = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        // When
        let timeAgo = sut.timeAgo()
        
        // Then
        XCTAssert(timeAgo == "Yesterday")
    }
    
    func testTimeAgoGetsTimeAgo() {
        // Given
        sut = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        
        // When
        let timeAgo = sut.timeAgo()
        
        // Then
        XCTAssert(timeAgo == "2 days ago")
    }
}
