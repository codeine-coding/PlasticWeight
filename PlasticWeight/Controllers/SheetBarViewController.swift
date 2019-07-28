//
//  SheetBarViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class SheetBarViewController: UIViewController, UniversalViewDelegate {
    
    private var gaugeTextField = DimensionTextField(for: .thickness)
    private var widthTextfield = DimensionTextField(for: .width)
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
        navigationItem.title = "Sheet / Bar"
        dimensionFields =  [gaugeTextField, widthTextfield, lengthTextField]
        view = UniversalView(dimensionFields: dimensionFields, calculation: .sheetBar, delegate: self)
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
