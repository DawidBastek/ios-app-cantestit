//
//  BaseTest.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 29/03/2023.
//

import Foundation
import XCTest

class BaseTest: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launch()
        continueAfterFailure = false
    }
}
