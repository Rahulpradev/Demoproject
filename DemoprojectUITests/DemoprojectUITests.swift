//
//  DemoprojectUITests.swift
//  DemoprojectUITests
//
//  Created by R, Rahul Pradev on 18/09/22.
//

import XCTest

@testable import Demoproject

final class DemoprojectUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

//    func testButton() throws {
//
//        //let vc = ViewController()
//            // Lines 1 and 2
//            let app = XCUIApplication()
//            app.launch()
//
//           // Line 3
//            app.buttons["Login"].tap()
//           // Line 4
////        let bgColor = try XCTUnwrap(vc.loginBtn.backgroundColor, "Color is black")
////        XCTAssertEqual(UIColor.black, bgColor)
//        XCTAssertEqual(app.buttons["Login"]., <#T##expression2: Equatable##Equatable#>)
//    }
    
    func testValidity() {
        
        let app = XCUIApplication()
        app.textFields["enter password"].tap()
        
        app.textFields.element.typeText("test")
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
//        app.staticTexts["Login"].buttons.firstMatch
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
}
