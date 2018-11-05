//
//  FormTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class FormTests: XCTestCase {
    var form: Form!
    var gaugeTextField: DimensionTextField!
    var widthTextField: DimensionTextField!
    var lengthTextField: DimensionTextField!

    override func setUp() {
        gaugeTextField = DimensionTextField(key: "gauge")
        widthTextField = DimensionTextField(key: "width")
        lengthTextField = DimensionTextField(key: "length")
        
        form = Form(controls: [gaugeTextField, widthTextField, lengthTextField])
        
    }

    override func tearDown() {
        form = nil
        gaugeTextField = nil
        widthTextField = nil
        lengthTextField = nil
    }

    func test_Init_SetsAllThreeTextFields() {
        XCTAssertEqual(form.controls?.count, 3)
    }
    
    func test_FormCalls_GaugeTextField_ByKey() {
        gaugeTextField.text = "0.220"
        
        XCTAssertEqual(form["gauge"], "0.220")
    }
    
    func test_FormCalls_WidthTextField_ByKey() {
        widthTextField.text = "48"
        
        XCTAssertEqual(form["width"], "48")
    }
    
    func test_FormCalls_LengthTextField_ByKey() {
        lengthTextField.text = "96"
        
        XCTAssertEqual(form["length"], "96")
    }
    
    func test_FormClearsAllTextFields() {
        gaugeTextField.text = "0.220"
        widthTextField.text = "48"
        lengthTextField.text = "96"
        
        form.clear()
        
        XCTAssertEqual(form["gauge"], "")
        XCTAssertEqual(form["width"], "")
        XCTAssertEqual(form["length"], "")
    }

}
