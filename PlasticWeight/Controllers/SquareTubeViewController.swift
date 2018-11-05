//
//  SquareTubeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SquareTubeViewController: UIViewController {
    var outerSquareWidthTextField: DimensionTextField!
    var wallTextField: DimensionTextField!
    var lengthTextField: DimensionTextField!
    var dimensionFields: [DimensionTextField]!
    
    var squareTubeView: UniversalView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Round Tube"
        
        outerSquareWidthTextField = DimensionTextField(titleForLabel: "(O)uter (S)q. Width")
        wallTextField = DimensionTextField(titleForLabel: "(W)all")
        lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
        
        dimensionFields = [outerSquareWidthTextField, wallTextField, lengthTextField]
        
        squareTubeView = UniversalView(dimensionFields: dimensionFields, calculation: .squareTube)
        squareTubeView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(squareTubeView)
        squareTubeView.edgeToEdgeConstraints(in: view)
        
    }


}
