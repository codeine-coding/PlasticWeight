//
//  RodViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class RodViewController: UIViewController {
    var diameterTextField: DimensionTextField!
    var lengthTextField: DimensionTextField!
    var dimensionFields: [DimensionTextField]!
    
    var rodView: UniversalView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Rod"
        
        diameterTextField = DimensionTextField(titleForLabel: "(D)iameter")
        lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
        dimensionFields = [diameterTextField, lengthTextField]
        
        rodView = UniversalView(dimensionFields: dimensionFields, calculation: .rod)
        rodView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rodView)
        
        rodView.edgeToEdgeConstraints(in: view)
    }

}
