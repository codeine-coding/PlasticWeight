//
//  SquareTubeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SquareTubeViewController: UIViewController, UniversalViewDelegate, ErrorDisplayer {
    private var outerSquareWidthTextField = DimensionTextField(for: .outerSquareWidth)
    private var wallTextField = DimensionTextField(for: .wall)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!
    
    var calculator: WeightCalculatorType
    
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
        navigationItem.title = TitleStrings.squareTube
        dimensionFields = [outerSquareWidthTextField, wallTextField, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .squareTube, delegate: self)
    }

}
