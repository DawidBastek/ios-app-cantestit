//
//  LoginTests.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 22/04/2023.
//

import XCTest

class LoginTests: BaseTest {
    
    func testLoginUser() {
        LoginScreen()
            .enterUsername(username: "user")
            .enterPassword(password: "password")
            .tapLoginButton()
        XCTAssertTrue(EventListScreen().isEventListHeaderDisplayed())

//        LoginScreen().enterUsername(username: "user")
//        LoginScreen().enterPassword(password: "password")
//        LoginScreen().tapLoginButton()
//        EventListScreen().isEventListHeaderDisplayed()
//
//        app.textFields["Enter username"].tap()
//        app.textFields["Enter username"].typeText("user")
//        app.secureTextFields["Enter password"].tap()
//        app.secureTextFields["Enter password"].typeText("password")
//        app.buttons["Login"].tap()
//        _ = app.staticTexts["Hello!"].waitForExistence(timeout: 5)
//        XCTAssertTrue(app.staticTexts["Hello!"].exists)
    }
    
    func testErrorMessage() {
        LoginScreen()
            .tapLoginButton()
        XCTAssertTrue(LoginScreen().isErrorMessageDisplayed())
    }
    
    func testVisitOurPage() {
        LoginScreen()
            .tapVisitPageLink()
        XCTAssertTrue(SafariScreen().isCantestitLogoDisplayed())
    }
}
