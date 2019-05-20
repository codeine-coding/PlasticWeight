//
//  MainViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 5/15/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

protocol MainVCDelegate: class {
    func calculateButtonPressed(on view: UniversalView)
}

class MainViewController: UIViewController {
    // sheet bar
    private var gaugeTextField = DimensionTextField(for: .thickness)
    private var widthTextfield = DimensionTextField(for: .width)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!

    // rod
    private var diameterTextField = DimensionTextField(for: .diameter)

    // round tube
    private var outerDiameterTextField = DimensionTextField(for: .outerDiameter)
    private var wallTextField = DimensionTextField(for: .wall)

    // square tube
    private var outerSquareWidthTextField = DimensionTextField(for: .outerSquareWidth)

    // Views
    private var sheetBarView: UniversalView!
    private var rodView: UniversalView!
    private var roundTubeView: UniversalView!
    private var squareTubeView: UniversalView!

    // Calculator
    private var calculator: WeightCalculatorType

    init(calculator: WeightCalculatorType) {
        self.calculator = calculator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }

    private func setupView() {
        switch navigationController?.tabBarItem.tag {
        case 0:
            navigationItem.title = "Sheet / Bar"
            dimensionFields =  [gaugeTextField, widthTextfield, lengthTextField]
            sheetBarView = UniversalView(dimensionFields: dimensionFields, calculation: .sheetBar, delegate: self)
            view = sheetBarView
        case 1:
            navigationItem.title = "Rod"
            dimensionFields = [diameterTextField, lengthTextField]
            rodView = UniversalView(dimensionFields: dimensionFields, calculation: .rod, delegate: self)
            view = rodView
        case 2:
            navigationItem.title = "Round Tube"
            dimensionFields = [outerDiameterTextField, wallTextField, lengthTextField]
            roundTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .roundTube, delegate: self)
            view = roundTubeView
        case 3:
            navigationItem.title = "Square Tube"
            dimensionFields = [outerSquareWidthTextField, wallTextField, lengthTextField]
            squareTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .squareTube, delegate: self)
            view = squareTubeView
        default:
            break
        }
    }

}

extension MainViewController: MainVCDelegate {
    func calculateButtonPressed(on view: UniversalView) {
        guard let selectedMaterialFactor = view.selectedMaterialFactor else {
            showError(for: ErrorMessage.noMaterialSelectedErrorMessage)
            return
        }
        do {
            view.weightLabel.textColor = .secondary

            var calculatedValue: Double
            switch view.materialType {
            case .sheetBar:
                calculatedValue = try calculator.calculateSheet(factor: selectedMaterialFactor,
                                                                thickness: view.dimensionFields[.thickness],
                                                                width: view.dimensionFields[.width],
                                                                length: view.dimensionFields[.length])
            case .rod:
                calculatedValue = try calculator.calculateRoundRod(factor: selectedMaterialFactor,
                                                                   diameter: view.dimensionFields[.diameter],
                                                                   length: view.dimensionFields[.length])
            case .roundTube:
                calculatedValue = try calculator.calculateRoundTube(factor: selectedMaterialFactor,
                                                                    outsideDiameter: view.dimensionFields[.outerDiameter],
                                                                    wall: view.dimensionFields[.wall],
                                                                    length: view.dimensionFields[.length])
            case .squareTube:
                calculatedValue = try calculator.calculateSquareTube(factor: selectedMaterialFactor,
                                                                     outsideSquareWidth: view.dimensionFields[.outerSquareWidth],
                                                                     wall: view.dimensionFields[.wall],
                                                                     length: view.dimensionFields[.length])
            }

            view.showWeightLabel(weight: String(calculatedValue))

        } catch CalculationError.invalidInput {
            showError(for: ErrorMessage.invalidInputErrorMessage)
        } catch CalculationError.zeroValue {
            showError(for: ErrorMessage.zeroValueErrorMessage)
        } catch {
            showError(for: ErrorMessage.unexpectedErrorMessage)
        }
    }
}
