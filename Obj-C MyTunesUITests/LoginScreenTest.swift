//
//  LoginScreenTest.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/8/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import XCTest

class LoginScreenTest: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLogin(){
        app.navigationBars["SearchResultsView"].buttons["Log In"].tap()
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("User")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("Pass")
        app.buttons["Log In"].tap()
        
        let errorAlert = app.alerts["Error"]
        errorAlert.staticTexts["Error"].tap()
        errorAlert.staticTexts["Invalid Credentials"].tap()
        errorAlert.buttons["Ok"].tap()
    }
    
}
