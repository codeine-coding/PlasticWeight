//
//  RodViewControllerTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class RodViewControllerTests: XCTestCase {
    
    var sut: RodViewController!

    override func setUp() {
        sut = RodViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_DiameterTextField_IsNotNil() {
        XCTAssertNotNil(sut.diameterTextField)
    }
    
    func test_DiameterTextField_HasTitleForLabel() {
        XCTAssertEqual(sut.diameterTextField.titleForLabel, "(D)iameter")
    }
    
    func test_LengthTextField_IsNotNil() {
        XCTAssertNotNil(sut.lengthTextField)
    }
    
    func test_LengthTextField_HasTitleForLabel() {
        XCTAssertEqual(sut.lengthTextField.titleForLabel, "(L)ength")
    }
    
    func test_HasRodViewAsUniversalView() {
        let rodViewIsSubview = sut.rodView.isDescendant(of: sut.view)
        XCTAssertTrue(rodViewIsSubview)
    }
    
    func test_RodViewAsUniversalView_HasMaterialTypeOfRod() {
        let rodView = sut.rodView
        XCTAssertEqual(rodView?.materialType, MaterialType.rod)
    }

}
