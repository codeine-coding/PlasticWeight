//
//  PlasticWeightUITests.swift
//  PlasticWeightUITests
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest

class PlasticWeightUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSnapshots() {
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Sheet / Bar"].tap()
        snapshot("01SheetBarView")
        tabBarsQuery.buttons["Rod"].tap()
        snapshot("02RodView")
        tabBarsQuery.buttons["Round Tube"].tap()
        snapshot("03RoundTubeView")
        tabBarsQuery.buttons["Square Tube"].tap()
        snapshot("04SquareTubeView")
    }

}
