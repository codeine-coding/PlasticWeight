//
//  CalculationFunctionsTest.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class CalculationFunctionsTest: XCTestCase {
    var acrylic: Plastic!
    var factor: Double!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        acrylic = Plastic(title: "Acrylic", factor: 0.0436)
        factor = acrylic.factor
    }
    
    func test_AcrylicSheetWeightCalc() {
        let thickness = "0.220"
        let width = "48"
        let length = "96"
        
        XCTAssertEqual(try calculateSheet(factor: factor, thickness: thickness, width: width, length: length), 44.2, "1/4 x 48 x 96 Acrylic should equal 44.2lbs")
    }
    
    func test_AcrylicRodWeightCalc() {
        let diameter = "3"
        let length = "96"
        
        XCTAssertEqual(try calculateRoundRod(factor: factor, diameter: diameter, length: length), 29.586)
    }
    
    func test_AcrylicRoundTubeWeightCalc() {
        let outsideDiameter = "3"
        let wall = ".125"
        let length = "96"
        XCTAssertEqual(try calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length), 4.725)
    }
    
    func test_AcrylicSquareTubeWeightCalc() {
        let outsideSquareWidth = "5"
        let wall = ".1875"
        let length = "96"
        XCTAssertEqual(try calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length), 3.139)
    }

}
