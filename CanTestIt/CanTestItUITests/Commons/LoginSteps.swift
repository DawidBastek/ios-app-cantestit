//
//  LoginSteps.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 30/03/2023.
//

import XCTest

extension BaseTest {
    
    func loginUserWith(name: String, password: String) {
        LoginScreen()
            .typeUsername(name: name)
            .typePassword(password: password)
            .tapLogin()
    }
}
