//
//  LoginScreen.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 29/03/2023.
//

import XCTest

final class LoginScreen: BaseScreen {

    private lazy var usernameTextField = app.textFields[ElementId.Login.usernameTextField].firstMatch
    private lazy var passwordTextField = app.secureTextFields[ElementId.Login.passwordTextField].firstMatch
    private lazy var loginButton = app.buttons[ElementId.Login.loginButton].firstMatch
    private lazy var loginError = app.staticTexts[ElementId.Login.loginError].firstMatch
    private lazy var visitPageLink = app.staticTexts[ElementId.Login.visitPage].firstMatch
    
    //Safari screen
    private lazy var safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    private lazy var canTestItLogo = safari.images["logo cantest it"].firstMatch

    
    @discardableResult
    func typeUsername(name: String) -> Self {
        usernameTextField.tap()
        usernameTextField.typeText(name)
        return self
    }
    
    @discardableResult
    func typePassword(password: String) -> Self {
        passwordTextField.tap()
        passwordTextField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLogin() -> Self {
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapVisitPage() -> Self {
        visitPageLink.tap()
        return self
    }
    
    @discardableResult
    func checkLoginErrorIsDisplayed() -> Self {
        XCTAssertTrue(loginError.exists)
        return self
    }
    
    @discardableResult
    func checkLogoOnWebisteIsDisplayed() -> Self {
        _ = canTestItLogo.waitForExistence(timeout: 5)
        XCTAssertTrue(canTestItLogo.exists)
        return self
    }
    
}
