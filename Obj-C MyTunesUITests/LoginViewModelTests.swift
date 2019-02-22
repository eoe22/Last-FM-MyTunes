//
//  LoginViewModelTests.swift
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/8/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

import XCTest

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
        
        viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(viewModel.state, .initial, "The state should be initial")
    }
    
    func testLogin(){
        viewModel.login(username: "Username", password: "Password")
        // XCTAssertEqual(viewModel.state, .invalid)
        
        let exp = XCTestExpectation()
        
        viewModel.stateChanged = { state in
            XCTAssertEqual(state, .invalid)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 2.0)
    }
    
    func testValid(){
        viewModel.login(username: "Username", password: "Username")
        XCTAssertEqual(viewModel.state, .authenticated)
    }
}
