//
//  MainViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 5/15/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // sheet bar
    var gaugeTextField = DimensionTextField(titleForLabel: "(T)hickness")
    var widthTextfield = DimensionTextField(titleForLabel: "(W)idth")
    var lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
    var dimensionFields: [DimensionTextField]!

    // rod
    var diameterTextField = DimensionTextField(titleForLabel: "(D)iameter")

    // round tube
    var outerDiameterTextField = DimensionTextField(titleForLabel: "(O)uter (D)iameter")
    var wallTextField = DimensionTextField(titleForLabel: "(W)all")

    // square tube
    var outerSquareWidthTextField = DimensionTextField(titleForLabel: "(O)uter (S)q. Width")

    var sheetBarView: UniversalView!
    var rodView: UniversalView!
    var roundTubeView: UniversalView!
    var squareTubeView: UniversalView!

    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }

    private func setupView() {
        switch navigationController?.tabBarItem.tag {
        case 0:
            navigationItem.title = "Sheet / Bar"
            dimensionFields =  [gaugeTextField, widthTextfield, lengthTextField]
            sheetBarView = UniversalView(dimensionFields: dimensionFields, calculation: .sheetBar)
            view = sheetBarView
        case 1:
            navigationItem.title = "Rod"
            dimensionFields = [diameterTextField, lengthTextField]
            rodView = UniversalView(dimensionFields: dimensionFields, calculation: .rod)
            view = rodView
        case 2:
            navigationItem.title = "Round Tube"
            dimensionFields = [outerDiameterTextField, wallTextField, lengthTextField]
            roundTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .roundTube)
            view = roundTubeView
        case 3:
            navigationItem.title = "Square Tube"
            dimensionFields = [outerSquareWidthTextField, wallTextField, lengthTextField]
            squareTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .squareTube)
            view = squareTubeView
        default:
            break
        }
    }

}
