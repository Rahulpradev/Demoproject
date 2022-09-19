//
//  DemoprojectTests.swift
//  DemoprojectTests
//
//  Created by R, Rahul Pradev on 18/09/22.
//

import XCTest
@testable import Demoproject

final class DemoprojectTests: XCTestCase {

    var sut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ViewController()
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testScoreIsComputedWhenGuessIsHigherThanTarget() {
      // given
      let guess = sut.targetValue + 5

      // when
      sut.check(guess: guess)

      // then
      XCTAssertGreaterThan(sut.targetValue, 5, "Score computed from guess is wrong")
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
