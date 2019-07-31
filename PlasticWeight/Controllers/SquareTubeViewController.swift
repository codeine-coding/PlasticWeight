//
//  SquareTubeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SquareTubeViewController: BaseMaterialTypeViewController {
    private var outerSquareWidthTextField = DimensionTextField(for: .outerSquareWidth)
    private var wallTextField = DimensionTextField(for: .wall)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!
    
    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }
    
    override func setupView() {
        navigationItem.title = TitleStrings.squareTube
        dimensionFields = [outerSquareWidthTextField, wallTextField, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .squareTube, delegate: self)
        super.setupView()
    }

}
