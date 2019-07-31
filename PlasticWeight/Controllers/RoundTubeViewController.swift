//
//  RoundTubeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class RoundTubeViewController: BaseMaterialTypeViewController {

    private var outerDiameterTextField = DimensionTextField(for: .outerDiameter)
    private var wallTextField = DimensionTextField(for: .wall)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!
    
    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }
    
    override func setupView() {
        navigationItem.title = TitleStrings.roundTube
        dimensionFields = [outerDiameterTextField, wallTextField, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .roundTube, delegate: self)
        super.setupView()
    }

}
