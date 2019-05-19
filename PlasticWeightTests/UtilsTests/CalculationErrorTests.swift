//
//  CalculationErrorTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class CalculationErrorTests: XCTestCase {
    var acrylic: Plastic!
    var factor: Double!
    var calculator: WeightCalculatorType = WeightCalculator()
    
    
    override func setUp() {
        acrylic = Plastic(title: "Acrylic", factor: 0.0436)
        factor = acrylic.factor
    }
    
    override func tearDown() {
        acrylic = nil
        factor = nil
    }
    
    // Sheet Zero Value Error Test
    func test_SheetThickness_InputEqualZero_ShouldThrow_ZeroValueError() {
        let thickness = "0" // Error
        let width = "48"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_SheetWidth_InputEqualZero_ShouldThrow_ZeroValueError() {
        let thickness = "0.220"
        let width = "0" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_SheetLength_InputEqualZero_ShouldThrow_ZeroValueError() {
        let thickness = "0.220"
        let width = "48"
        let length = "0" // Error
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    
    // Rod Zero Value Error Test
    func test_RodDiameter_InputEqualZero_ShouldThrow_ZeroValueError() {
        let diameter = "0" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundRod(factor: factor, diameter: diameter, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_RodLength_InputEqualZero_ShouldThrwo_ZeroValueError() {
        let diameter = "3.00"
        let length = "0" // Error
        
        XCTAssertThrowsError(try calculator.calculateRoundRod(factor: factor, diameter: diameter, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    
    // Round Tube Zero Value Error Test
    func test_RoundTubeOutsideDiameter_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideDiameter = "0" // Error
        let wall = "0.125"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_RoundTubeWall_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideDiameter = "3.00"
        let wall = "0" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_RoundTubeLength_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideDiameter = "3.00"
        let wall = "0.125"
        let length = "0" // Error
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    
    // Square Tube Zero Input Error
    func test_SquareTubeOutsideSquareWidth_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideSquareWidth = "0" // Error
        let wall = "0.125"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_SquareTubeWall_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideSquareWidth = "3.00"
        let wall = "0" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    func test_SquareTubeLength_InputEqualZero_ShouldThrow_ZeroValueError() {
        let outsideSquareWidth = "3.00"
        let wall = "0.125"
        let length = "0" // Error
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.zeroValue)
        }
    }
    
    
    // Sheet Invalid Input Error Test
    func test_SheetThickness_InvalidInput_ShouldThrow_InputError() {
        let thickness = "96U" // Error
        let width = "48"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_SheetWidth_InvalidInput_ShouldThrow_InputError() {
        let thickness = "0.220"
        let width = "48x" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_SheetLength_InvalidInput_ShouldThrow_InputError() {
        let thickness = "0.220"
        let width = "48"
        let length = "96*" // Error
        
        XCTAssertThrowsError(try calculator.calculateSheet(factor: factor, thickness: thickness, width: width, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    
    // Rod Invalid Input Error Tests
    func test_RodDiameter_InvalidInput_ShouldThrow_InputError() {
        let diameter = "tx" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundRod(factor: factor, diameter: diameter, length: length)) { error in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_RodDLength_InvalidInput_ShouldThrow_InputError() {
        let diameter = "3.00"
        let length = "96u" // Error
        
        XCTAssertThrowsError(try calculator.calculateRoundRod(factor: factor, diameter: diameter, length: length)) { error in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    
    // Round Tube Invalid Input Error
    func test_RoundTubeOutsideDiameter_InvalidInput_ShouldThrow_InputError() {
        let outsideDiameter = "3.00TY" // Error
        let wall = "0.125"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_RoundTubeWall_InvalidInput_ShouldThrow_InputError() {
        let outsideDiameter = "3.00"
        let wall = "hgh" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_RoundTubeLength_InvalidInput_ShouldThrow_InputError(){
        let outsideDiameter = "3.00"
        let wall = "0.125"
        let length = "96U" // Error
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    
    // Square Tube Invalid Input Error
    func test_SquareTubeOutsideSquareWidth_InvalidInput_ShouldThrow_InputError() {
        let outsideSquareWidth = "6U" // Error
        let wall = "0.125"
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_SquareTubeWall_InvalidInput_ShouldThrow_InputError() {
        let outsideSquareWidth = "3.00"
        let wall = "0.gh" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    func test_SquareTubeLength_InvalidInput_ShouldThrow_InputError() {
        let outsideSquareWidth = "3.00"
        let wall = "0.125"
        let length = "96P" // Error
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.invalidInput)
        }
    }
    
    
    // Round Tube Wall Greater Than Outside Diameter Error Tests
    func test_RoundTubeWallDoubled_GreaterThan_OutsideDiameter_ShouldThrow_WallDoubledGreaterThanOrEqualToOutterField() {
        let outsideDiamter = "3.00"
        let wall = "2.5" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiamter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.wallDoubledGreaterThanOrEqualToOutterField(outterField: "outter diameter"))
        }
    }
    
    func test_RoundTube_WallDoubled_EqualTo_OutsideDiameter_ShouldThrow_WallDoubledGreaterThanOrEqualToOutterField() {
        let outsideDiameter = "3.00"
        let wall = "1.5" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateRoundTube(factor: factor, outsideDiameter: outsideDiameter, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.wallDoubledGreaterThanOrEqualToOutterField(outterField: "outter diameter"))
        }
    }
    // Square Tube Wall Greater Than Outside Diameter Tests
    func test_SquareTube_WallDoubled_GreaterThan_OutsideSquareWidth_ShouldThrow_WallDoubledGreaterThanOrEqualToOutterField() {
        let outsideSquareWidth = "3.00"
        let wall = "2.5" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.wallDoubledGreaterThanOrEqualToOutterField(outterField: "outer square width"))
        }
    }
    
    func test_SquareTube_WallDoubled_EqualTo_OutsideSquareWidth_ShouldThrow_WallDoubledGreaterThanOrEqualToOutterField() {
        let outsideSquareWidth = "3.00"
        let wall = "1.5" // Error
        let length = "96"
        
        XCTAssertThrowsError(try calculator.calculateSquareTube(factor: factor, outsideSquareWidth: outsideSquareWidth, wall: wall, length: length)) { (error) in
            XCTAssertEqual(error as? CalculationError, CalculationError.wallDoubledGreaterThanOrEqualToOutterField(outterField: "outer square width"))
        }
    }
}
