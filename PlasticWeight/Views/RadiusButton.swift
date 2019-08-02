//
//  RadiusButton.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

@IBDesignable
class RadiusButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 10.0
        titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
    }
}
