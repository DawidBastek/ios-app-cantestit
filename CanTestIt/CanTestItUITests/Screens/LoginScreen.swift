//
//  LoginScreen.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 22/04/2023.
//

import XCTest

class LoginScreen: BaseScreen {
    private lazy var usernameTextField = app.textFields[ElementId.Login.usernameTextField].firstMatch
    private lazy var passwordTextField = app.secureTextFields[ElementId.Login.passwordTextField].firstMatch
    private lazy var loginButton = app.buttons[ElementId.Login.loginButton].firstMatch
    private lazy var errorMessageText = app.staticTexts[ElementId.Login.errorMessageText].firstMatch
    private lazy var visitPageLink = app.staticTexts[ElementId.Login.visitPageLink].firstMatch
    
    @discardableResult
    func enterUsername(username: String) -> Self {
        usernameTextField.tap()
        usernameTextField.typeText(username)
        return self
    }
    
    @discardableResult
    func enterPassword(password: String) -> Self {
        passwordTextField.tap()
        passwordTextField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapVisitPageLink() -> Self {
        visitPageLink.tap()
        return self
    }
    
    func isErrorMessageDisplayed() -> Bool {
        return errorMessageText.exists
    }
}
