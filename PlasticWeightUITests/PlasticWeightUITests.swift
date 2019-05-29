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
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testSheetBarVC_Exists_AndIsFirstViewLoaded() {
        app.launch()
        XCTAssertTrue(app.navigationBars["Sheet / Bar"].exists, "Sheet Bar View Should be first view controller")

    }

    func testRodVC_Exists() {
        app.launch()
        let title = "Rod"
        app.tabBars.buttons[title].tap()
        XCTAssertFalse(app.navigationBars[title].exists)
    }

    func testRoundTubeVC_Exists() {
        app.launch()
        let title = "Round Tube"
        app.tabBars.buttons[title].tap()
        XCTAssertFalse(app.navigationBars[title].exists)
    }

    func testSquareTubeVC_Exists() {
        app.launch()
        let title = "Square Tube"
        app.tabBars.buttons[title].tap()
        XCTAssertFalse(app.navigationBars[title].exists)
    }

    func testAlertView_WhenSelectedMaterial_IsEmpty() {

        app.launch()
        let sheetView = app.otherElements["SheetView"]
        XCTAssertTrue(sheetView.exists)
//        let textField = sheetView.descendants(matching: .textField)
        let materialSelect = app.textFields["Select Material"]
        XCTAssertTrue(materialSelect.exists)
        materialSelect.tap()
        let picker = sheetView.descendants(matching: .picker).element
        XCTAssertTrue(picker.exists)

//        picker.children(matching: .pickerWheel).element.swipeUp()
//        app.pickers.children(matching: .pickerWheel).element.swipeUp()

//        let app = XCUIApplication()
//        app.textFields["Select Material"].tap()
//        app.pickers.children(matching: .pickerWheel).element.swipeUp()
//        app.toolbars["Toolbar"].buttons["Done"].tap()


    }

    func testGetSnapshots() {
        setupSnapshot(app)
        app.launch()
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
