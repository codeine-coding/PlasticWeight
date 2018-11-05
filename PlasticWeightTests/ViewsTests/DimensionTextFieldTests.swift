//
//  DimensionTextFieldTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class DimensionTextFieldTests: XCTestCase {
    var heightField: DimensionTextField!

    override func setUp() {
        heightField = DimensionTextField(key: "height")
    }

    override func tearDown() {
        heightField = nil
    }
    
    func test_HeightFieldKey_WasSet() {
        XCTAssertEqual(heightField.key, "height")
    }
    
    func test_HeightField_Clears() {
        heightField.text = "12"
        heightField.clear()
        XCTAssertEqual(heightField.text, "")
    }

}
