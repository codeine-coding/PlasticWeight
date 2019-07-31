//
//  UniversalViewDelegate.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

protocol UniversalViewDelegate: class {
    var calculator: WeightCalculatorType { get set }
    func calculateButtonPressed(on view: UniversalView)
}

extension UniversalViewDelegate where Self: UIViewController & ErrorDisplayer {
    func calculateButtonPressed(on view: UniversalView) {
        guard let selectedMaterialDensityMeasure = view.selectedMaterialDensityMeasure else {
            showError(for: ErrorMessage.noMaterialSelectedErrorMessage)
            return
        }
        do {
            view.weightLabel.textColor = .secondary
            
            var calculatedValue: Double
            switch view.materialType {
            case .sheetBar:
                calculatedValue = try calculator.calculateSheet(densityMesure: selectedMaterialDensityMeasure,
                                                                thickness: view.dimensionFields[.thickness],
                                                                width: view.dimensionFields[.width],
                                                                length: view.dimensionFields[.length])
            case .rod:
                calculatedValue = try calculator.calculateRoundRod(densityMesure: selectedMaterialDensityMeasure,
                                                                   diameter: view.dimensionFields[.diameter],
                                                                   length: view.dimensionFields[.length])
            case .roundTube:
                calculatedValue = try calculator.calculateRoundTube(densityMesure: selectedMaterialDensityMeasure,
                                                                    outsideDiameter: view.dimensionFields[.outerDiameter],
                                                                    wall: view.dimensionFields[.wall],
                                                                    length: view.dimensionFields[.length])
            case .squareTube:
                calculatedValue = try calculator.calculateSquareTube(densityMesure: selectedMaterialDensityMeasure,
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
