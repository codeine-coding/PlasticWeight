//
//  SheetBarVCTests.swift
//  PlasticWeightUITests
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class SheetBarVCTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        app = nil
    }

    func testSheetBarVC_isFirstVC() {
        let sheetBar = NSLocalizedString("Sheet / Bar", comment: "sheet bar")
        XCTAssertTrue(app.navigationBars[sheetBar].exists)
        XCTAssertTrue(app.tabBars.buttons[sheetBar].exists)
//        XCUIApplication().navigationBars["Sheet / Bar"].otherElements["Sheet / Bar"].tap()
        
        
    }

}
