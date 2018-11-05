//
//  RoundTubeViewControllerTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class RoundTubeViewControllerTests: XCTestCase {
    
    var sut: RoundTubeViewController!

    override func setUp() {
        sut = RoundTubeViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_OuterDiameterTextField_IsNotNil() {
        XCTAssertNotNil(sut.outerDiameterTextField)
    }
    
    func test_OuterDiameterTextField_HasTitleForLabel() {
        XCTAssertEqual(sut.outerDiameterTextField.titleForLabel, "(O)uter (D)iameter")
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
    
    func test_RoundTubeViewAsUniversalView_IsSubView() {
        let rodTubeViewIsSubview = sut.roundTubeView.isDescendant(of: sut.view)
        XCTAssertTrue(rodTubeViewIsSubview)
    }
    
    func test_RoundTubeViewAsUniversalView_HasMaterialTypeOfRoundTube() {
        XCTAssertEqual(sut.roundTubeView.materialType, MaterialType.roundTube)
    }

}
