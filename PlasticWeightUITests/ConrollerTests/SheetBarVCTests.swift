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
        let sheet = NSLocalizedString("Sheet", comment: "sheet")
        XCTAssertTrue(app.navigationBars[sheetBar].exists)
        XCTAssertTrue(app.tabBars.buttons[sheet].exists)
    }
    
    func testSelectMaterialField_Exists() {
        XCTAssertTrue(materialPickerField.exists)
    }
    
    func testSelectMaterialField_isHitable() {
        XCTAssertTrue(materialPickerField.isHittable)
    }
    
    func testSelectMaterialField_OnDoubleTap_MaterialPicker_IsDisplayed() {
        materialPickerField.doubleTap()
        let picker = app.pickers["Material Picker"]
        XCTAssertTrue(picker.exists)
    }
    
    func testMaterialPicker_OnItemSelect_SelectMaterialFieldChangesToValue() {
        materialPickerField.doubleTap()
        let pickerWheel = app.pickerWheels.element
        
        pickerWheel.adjust(toPickerWheelValue: "ABS")
        XCTAssertTrue(materialPickerField.value as! String == "ABS")
    }
    
    func testPickerDismisses_WhenToolBarDoneButtonPressed() {
        materialPickerField.doubleTap()
        let pickerWheel = app.pickerWheels.element
        XCTAssertTrue(pickerWheel.exists)
        pickerWheel.adjust(toPickerWheelValue: "Acrylic")
        app.toolbars.buttons["Done"].tap()
        XCTAssertFalse(pickerWheel.exists)
    }
    
    
    func testCalculateBtn_WithAllValidInputs() {
        materialPickerField.doubleTap()
        let pickerWheel = app.pickerWheels.element
        pickerWheel.adjust(toPickerWheelValue: "Acrylic")
        app.toolbars.buttons["Done"].tap()
        
        thicknessField.doubleTap()
        thicknessField.typeText(".220")
        
        widthField.doubleTap()
        widthField.typeText("48")
        
        lengthField.doubleTap()
        lengthField.typeText("96")
        app.toolbars.buttons["Done"].tap()
        
        app.buttons["Calculate"].tap()
        
    }
    
}


private extension SheetBarVCTests {
    var materialPickerField: XCUIElement {
        let selectMaterial = NSLocalizedString("Select Material", comment: "label for material picker")
        return app.textFields[selectMaterial]
    }
    
    var thicknessField: XCUIElement {
        let thickness = NSLocalizedString("(T)hickness", comment: "(T)hickness")
        return app.textFields[thickness]
    }
    
    var widthField: XCUIElement {
        let width = NSLocalizedString("(W)idth", comment: "(W)idth")
        return app.textFields[width]
    }
    
    var lengthField: XCUIElement {
        let length = NSLocalizedString("(L)ength", comment: "(L)ength")
        return app.textFields[length]
    }
}
