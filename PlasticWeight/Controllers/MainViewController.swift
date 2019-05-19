//
//  MainViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 5/15/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

protocol MainVCDelegate: class {
    func calculateButtonPressed(view: UniversalView)
}

class MainViewController: UIViewController {
    // sheet bar
    private var gaugeTextField = DimensionTextField(titleForLabel: "(T)hickness")
    private var widthTextfield = DimensionTextField(titleForLabel: "(W)idth")
    private var lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
    private var dimensionFields: [DimensionTextField]!

    // rod
    private var diameterTextField = DimensionTextField(titleForLabel: "(D)iameter")

    // round tube
    private var outerDiameterTextField = DimensionTextField(titleForLabel: "(O)uter (D)iameter")
    private var wallTextField = DimensionTextField(titleForLabel: "(W)all")

    // square tube
    private var outerSquareWidthTextField = DimensionTextField(titleForLabel: "(O)uter (S)q. Width")

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
    func calculateButtonPressed(view: UniversalView) {
        guard let selectedMaterialFactor = view.selectedMaterialFactor else {
            showError(for: ErrorMessage.noMaterialSelectedErrorMessage)
            return
        }
        do {
            view.weightLabel.textColor = .secondary

            var calculatedValue: Double
            switch view.materialType {
            case .sheetBar:
                guard
                    let thickness = view.dimensionFields[safe: 0]?.text,
                    let width = view.dimensionFields[safe: 1]?.text,
                    let length = view.dimensionFields[safe: 2]?.text
                else {
                    return
                }
                calculatedValue = try calculator.calculateSheet(factor: selectedMaterialFactor,
                                                                thickness: thickness,
                                                                width: width,
                                                                length: length)
            case .rod:
                guard
                    let diameter = view.dimensionFields[safe: 0]?.text,
                    let length = view.dimensionFields[safe: 1]?.text
                    else {
                        return
                }
                calculatedValue = try calculator.calculateRoundRod(factor: selectedMaterialFactor,
                                                                   diameter: diameter,
                                                                   length: length)
            case .roundTube:
                calculatedValue = try calculator.calculateRoundTube(factor: selectedMaterialFactor,
                                                                    outsideDiameter: view.dimensionFields[0].text!,
                                                                    wall: view.dimensionFields[1].text!,
                                                                    length: view.dimensionFields[2].text!)
            case .squareTube:
                calculatedValue = try calculator.calculateSquareTube(factor: selectedMaterialFactor,
                                                                     outsideSquareWidth: view.dimensionFields[0].text!,
                                                                     wall: view.dimensionFields[1].text!,
                                                                     length: view.dimensionFields[2].text!)
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
