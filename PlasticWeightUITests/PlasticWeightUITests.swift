//
//  PlasticWeightUITests.swift
//  PlasticWeightUITests
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class PlasticWeightUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testSheetBarVCTabBarButton_Exists() {
        let title = "Sheet / Bar"
        XCTAssertTrue(app.tabBars.buttons[title].exists)
    }

    func testRodVCTabBarButton_Exists() {
        let title = "Rod"
        XCTAssertTrue(app.tabBars.buttons[title].exists)
    }

    func testRoundTubeVCTabBarButton_Existss() {
        let title = "Round Tube"
        XCTAssertTrue(app.tabBars.buttons[title].exists)
    }

    func testSquareTubeVTabBarButton_Exists() {
        let title = "Square Tube"
        XCTAssertTrue(app.tabBars.buttons[title].exists)
    }

    func testGetSnapshots() {
        setupSnapshot(app)
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
