//
//  RodViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class RodViewController: BaseMaterialTypeViewController {

    private var diameterTextField = DimensionTextField(for: .diameter)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!
    
    
    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }
    
    override func setupView() {
        navigationItem.title = TitleStrings.rod
        dimensionFields = [diameterTextField, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .rod, delegate: self)
        super.setupView()
    }

}
