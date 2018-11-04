//
//  DimensionTextField.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class DimensionTextField: UITextField {
    var key: String?

    init(key: String?) {
        self.key = key
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.00
        layer.borderColor = UIColor.secondary.cgColor
        layer.borderWidth = 2.0
        textColor = .primary
        placeholder = "0.00"
        font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        textAlignment = .center
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        keyboardType = .decimalPad
        
        // text field clears on edit
        clearsOnBeginEditing = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DimensionTextField: FormControl {
    func clear() {
        text = nil
    }
}
