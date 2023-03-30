//
//  LoginTests.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 29/03/2023.
//

import XCTest

class LoginTests: BaseTest {
    
    func testLoginUser() {
        LoginScreen()
            .typeUsername(name: "user")
            .typePassword(password: "password")
            .tapLogin()
        EventsListScreen()
            .checkFindYourEventTextIsDisplayed()
        
//        LoginScreen().typeUsername(name: "user")
//        LoginScreen().typePassword(password: "password")
//        LoginScreen().tapLogin()
        
//        app.textFields.firstMatch.tap()
//        app.textFields.firstMatch.typeText("user")
//        app.secureTextFields.firstMatch.tap()
//        app.secureTextFields.firstMatch.typeText("password")
//        app.buttons["Login"].tap()
//        XCTAssertTrue(XCUIApplication().staticTexts["Find your event"].exists)
    }
    
    func testLoginUserWithError() {
        LoginScreen()
            .typeUsername(name: "wrong")
            .typePassword(password: "password")
            .tapLogin()
            .checkLoginErrorIsDisplayed()
    }
    
    func testVisitPage() {
        LoginScreen()
            .tapVisitPage()
            .checkLogoOnWebisteIsDisplayed()
    }

}
