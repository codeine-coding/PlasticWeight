//
//  RoundTubeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class RoundTubeViewController: UIViewController {
    var outerDiameterTextField: DimensionTextField!
    var wallTextField: DimensionTextField!
    var lengthTextField: DimensionTextField!
    var dimensionFields: [DimensionTextField]!
    
    var roundTubeView: UniversalView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Round Tube"
        
        outerDiameterTextField = DimensionTextField(titleForLabel: "(O)uter (D)iameter")
        wallTextField = DimensionTextField(titleForLabel: "(W)all")
        lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
        
        dimensionFields = [outerDiameterTextField, wallTextField, lengthTextField]
        
        roundTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .roundTube)
        roundTubeView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(roundTubeView)
        roundTubeView.edgeToEdgeConstraints(in: view)
        
    }

}
