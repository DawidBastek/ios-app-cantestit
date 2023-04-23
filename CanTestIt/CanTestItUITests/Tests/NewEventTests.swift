//
//  NewEventTests.swift
//  CanTestItUITests
//
//  Created by Dawid Bastek on 23/04/2023.
//

import XCTest

class NewEventTests: BaseTest {
    
    func testAddNewEvent() {
        let name = "Test\(String(Int.random(in: 1...100)))"
        
        CommonSteps()
            .loginUser()
        EventListScreen()
            .tapAddEventButton()
        AddEventScreen()
            .tapCoverPhotoButton()
            .choosePictureWith(index: 1)
            .tapChooseButton()
            .enterEventName(name: name)
            .chooseEventCategoryWith(label: "Workshop")
            .chooseStartDate()
            .chooseEndDate()
            .enterEventPrice(price: "100")
            .tapPremiumSwitch()
            .tapSaveButton()
        XCTAssertTrue(EventListScreen().isEventDisplayedWithName(name: name))
    }
}
