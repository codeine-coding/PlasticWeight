//
//  SheetBarViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SheetBarViewController: BaseMaterialTypeViewController{
    
    private var gaugeTextField = DimensionTextField(for: .thickness)
    private var widthTextfield = DimensionTextField(for: .width)
    private var lengthTextField = DimensionTextField(for: .length)
    private var dimensionFields: [DimensionTextField]!
    
    override func loadView() {
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setupView()
    }
    
    override func setupView() {
        navigationItem.title = TitleStrings.sheetbar
        dimensionFields =  [gaugeTextField, widthTextfield, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .sheetBar, delegate: self)
        super.setupView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
