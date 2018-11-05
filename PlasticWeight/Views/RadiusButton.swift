//
//  RadiusButton.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class RadiusButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.00
        titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
