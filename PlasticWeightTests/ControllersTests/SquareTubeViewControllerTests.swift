//
//  SquareTubeViewControllerTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class SquareTubeViewControllerTests: XCTestCase {
    var sut: SquareTubeViewController!
    
    override func setUp() {
        sut = SquareTubeViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_OuterSqWidthTextField_IsNotNil() {
        XCTAssertNotNil(sut.outerSquareWidthTextField)
    }
    
    func test_OuterDiameterTextField_HasTitleForLabel() {
        XCTAssertEqual(sut.outerSquareWidthTextField.titleForLabel, "(O)uter (S)q. Width")
    }
    
    func test_WallTextField_IsNotNil() {
        XCTAssertNotNil(sut.wallTextField)
    }
    
    func test_WallTextField_HasTitleForLabel() {
        XCTAssertEqual(sut.wallTextField.titleForLabel, "(W)all")
    }
    
    func test_LengthTexField_isNotNil() {
        XCTAssertNotNil(sut.lengthTextField)
    }
    
    func test_LengthTexField_HasTitleForLabel() {
        XCTAssertEqual(sut.lengthTextField.titleForLabel, "(L)ength")
    }
    
    func test_SquareTubeViewAsUniversalView_IsSubView() {
        let squareTubeViewIsSubview = sut.squareTubeView.isDescendant(of: sut.view)
        XCTAssertTrue(squareTubeViewIsSubview)
    }
    
    func test_SquareTubeViewAsUniversalView_HasMaterialTypeOfSquareTube() {
        XCTAssertEqual(sut.squareTubeView.materialType, MaterialType.squareTube)
    }

}
