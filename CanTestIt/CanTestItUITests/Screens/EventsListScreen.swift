//
//  EventsListScreen.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 30/03/2023.
//

import XCTest

final class EventsListScreen: BaseScreen {
    
    private lazy var findYourEventText = app.staticTexts[ElementId.EventsList.findEventText].firstMatch
    private lazy var addEventButton = app.buttons[ElementId.EventsList.addEventButton].firstMatch
    
    @discardableResult
    func tapAddEventButton() -> Self {
        _ = addEventButton.waitForExistence(timeout: 5)
        addEventButton.tap()
        return self
    }
    
    @discardableResult
    func checkFindYourEventTextIsDisplayed() -> Self {
        XCTAssertTrue(findYourEventText.exists)
        return self
    }
    
    @discardableResult
    func checkNewEventIsDisplayedWith(eventName: String) -> Self {
        swipeDownUntil(element: app.staticTexts[eventName])
        XCTAssertTrue(app.staticTexts[eventName].exists)
        return self
    }
}
