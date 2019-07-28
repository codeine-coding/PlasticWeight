//
//  UniversalViewTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class UniversalViewTests: XCTestCase {
    var sut: UniversalView!
    var mainVC: SheetBarViewController!
    var calculator: WeightCalculatorType = ImperialWeightCalculator()
    var gaugeTextField = DimensionTextField(for: .thickness)
    var widthTextfield = DimensionTextField(for: .width)
    var lengthTextField = DimensionTextField(for: .length)

    override func setUp() {
        mainVC = SheetBarViewController(calculator: calculator)
        mainVC.loadViewIfNeeded()
        let textFields: [DimensionTextField] = [
            gaugeTextField,
            widthTextfield,
            lengthTextField
        ]
        sut = UniversalView(dimensionFields: textFields, calculation: .sheetBar, delegate: mainVC)
    }

    override func tearDown() {
        mainVC = nil
    }

    func test_HasMaterialTextField() {
        let materialTextFieldIsSubview = sut.materialTextField.isDescendant(of: sut)
        XCTAssertTrue(materialTextFieldIsSubview)
    }

    func test_HasMaterialUnderlineView() {
        let materialUnderlineViewIsSubview = sut.materialUnderlineView.isDescendant(of: sut)
        XCTAssertTrue(materialUnderlineViewIsSubview)
    }

    func test_HasMaterialChoiceStack() {
        let materialChoiceStackIsSubview = sut.materialChoiceStackView.isDescendant(of: sut)
        XCTAssertTrue(materialChoiceStackIsSubview)
    }

    func test_MaterialPickerNotNil() {
        XCTAssertNotNil(sut.materialPicker)
    }

    func test_HasDimensionStackView() {
        let dimensionStackViewIsSubview = sut.dimensionsStackView.isDescendant(of: sut)
        XCTAssertTrue(dimensionStackViewIsSubview)
    }

    func test_HasWeightLabel() {
        let weightLabelIsSubView = sut.weightLabel.isDescendant(of: sut)
        XCTAssertTrue(weightLabelIsSubView)
    }

    func test_HasPoundsLabel() {
        let poundsLabelIsSubview = sut.poundsLabel.isDescendant(of: sut)
        XCTAssertTrue(poundsLabelIsSubview)
    }

    func test_HasWeightPoundsStackView() {
        let stackViewIsSubView = sut.weightPoundStackView.isDescendant(of: sut)
        XCTAssertTrue(stackViewIsSubView)
    }

    func test_HasCalculateButton() {
        let calcBtnIsSubview = sut.calculateBtn.isDescendant(of: sut)
        XCTAssertTrue(calcBtnIsSubview)
    }

    func test_HasClearFieldsButton() {
        let clearBtnIsSubview = sut.clearFieldsBtn.isDescendant(of: sut)
        XCTAssertTrue(clearBtnIsSubview)
    }

    func test_HasCalcClearBtnStackView() {
        let calcClearBtnStackIsSubview = sut.buttonStackView.isDescendant(of: sut)
        XCTAssertTrue(calcClearBtnStackIsSubview)
    }

    func test_HasMaterialTypeImage() {
        let imageIsSubview = sut.materialTypeImage.isDescendant(of: sut)
        XCTAssertTrue(imageIsSubview)
    }




}
