//
//  BaseScreen.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 29/03/2023.
//

import XCTest

class BaseScreen {
    let app = XCUIApplication()
    
    func swipeDownUntil(element: XCUIElement) {
        var numberOfScrolls = 0
        while numberOfScrolls <= 15 && !element.isHittable {
            app.tables.element.swipeUp()
            numberOfScrolls += 1
        }
        
    }
}
