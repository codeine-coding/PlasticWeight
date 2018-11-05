//
//  SheetBarViewControllerTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class SheetBarViewControllerTests: XCTestCase {
    var sut: SheetBarViewController!
    
    override func setUp() {
        sut = SheetBarViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_GaugeTextField_IsNotNil() {
        XCTAssertNotNil(sut.gaugeTextField)
    }
    
    func test_GaugeTextField_InitializedWithKey() {
        XCTAssertEqual(sut.gaugeTextField.titleForLabel, "(T)hickness")
    }
    
    func test_WidthTextField_IsNotNil() {
        XCTAssertNotNil(sut.widthTextfield)
    }
    
    func test_WidthTextField_InitializedWithKey() {
        XCTAssertEqual(sut.widthTextfield.titleForLabel, "(W)idth")
    }
    
    func test_LengthTextField_IsNotNil() {
        XCTAssertNotNil(sut.lengthTextField)
    }
    
    func test_LengthTextField_InitializedWithKey() {
        XCTAssertEqual(sut.lengthTextField.titleForLabel, "(L)ength")
    }
    
    func test_HasUniversalView() {
        let universalViewIsSubview = sut.sheetBarView?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(universalViewIsSubview)
    }

}
