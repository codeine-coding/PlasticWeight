//
//  TextFieldStackView.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class TextFieldStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fill
        alignment = .fill
        spacing = 2
        axis = .vertical
        sizeToFit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
