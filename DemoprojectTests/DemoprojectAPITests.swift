//
//  DemoprojectAPITests.swift
//  DemoprojectTests
//
//  Created by R, Rahul Pradev on 18/09/22.
//

import XCTest
@testable import Demoproject

final class DemoprojectAPITests: XCTestCase {

    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }

    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
      // given
      let urlString =
        "https://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }

    
    func testApiCallCompletes() throws {
      // given
      let urlString = "https://www.randomnumberapi.com/test"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
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
