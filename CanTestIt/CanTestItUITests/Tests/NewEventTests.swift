//
//  NewEventTests.swift
//  CanTestIt
//
//  Created by Dawid Bastek on 30/03/2023.
//

import XCTest

final class NewEventTests: BaseTest {
    
    func testAddNewEvent() {
        loginUserWith(name: UserData.name, password: UserData.password)
        
        EventsListScreen()
            .tapAddEventButton()
        
        app.buttons["Tap choose your cover photo"].tap()
        app.collectionViews.element.swipeLeft()
        app.buttons["Choose"].tap()
        app.textFields["newEventTitleTextField"].tap()
        let random = String(Int.random(in: 1...1000))
        let testName = "Test\(random)"
        app.textFields["newEventTitleTextField"].typeText(testName)
        app.otherElements["chooseCategoryDropdown"].tap()
        app.tables.cells.firstMatch.tap()
        app.textFields["newEventStartDateTextField"].tap()
        app.buttons["Done"].firstMatch.tap()
        app.textFields[ElementId.NewEvent.endDateTextField].tap()
        app.buttons["Done"].firstMatch.tap()
        app.textFields[ElementId.NewEvent.priceTextField].tap()
        app.textFields[ElementId.NewEvent.priceTextField].typeText("100")
        app.switches[ElementId.NewEvent.premiumEventSwitch].tap()
        app.buttons[ElementId.NewEvent.saveButton].tap()
        EventsListScreen()
            .checkNewEventIsDisplayedWith(eventName: testName)
        }
}
