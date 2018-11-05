//
//  SheetBarViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SheetBarViewController: UIViewController {
    var gaugeTextField: DimensionTextField!
    var widthTextfield: DimensionTextField!
    var lengthTextField: DimensionTextField!
    var dimensionFields: [DimensionTextField]!
    
    var sheetBarView: UniversalView!

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Set navigation bar
        //
        /// set bar style to light color
        /// because this view sits within a navigation controller, you must set the navigation bar style
        /// to black translucent (white) rather than using "preferredStatusBarStyle"
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Sheet / Bar"
        
        gaugeTextField = DimensionTextField(titleForLabel: "(T)hickness")
        widthTextfield = DimensionTextField(titleForLabel: "(W)idth")
        lengthTextField = DimensionTextField(titleForLabel: "(L)ength")
        
        dimensionFields =  [gaugeTextField, widthTextfield, lengthTextField]
        
        sheetBarView = UniversalView(dimensionFields: dimensionFields, calculation: .sheetBar)
        sheetBarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sheetBarView)
        
        NSLayoutConstraint.activate([
            sheetBarView.topAnchor.constraint(equalTo: view.topAnchor),
            sheetBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }

}
