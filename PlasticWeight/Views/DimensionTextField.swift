//
//  DimensionTextField.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class DimensionTextField: UITextField {
    var inputType: InputField?
    let defaults = PWUserDefaults.shared

    init(for inputType: InputField?) {
        self.inputType = inputType
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupView()
    }
    
    private func setupView() {
        accessibilityLabel = inputType?.title
        isUserInteractionEnabled = true
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
        let iconImage = UIImage(named: defaults.isImperialCalculator ? "in.png" : "mm.png")
        setIcon(iconImage!)
        
        // text field clears on edit
        clearsOnBeginEditing = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        iconView.image = image
        iconView.tintColor = .primary
        let padding: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        iconContainerView.addSubview(iconView)
        iconContainerView.addSubview(padding)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

extension DimensionTextField: FormControl {
    func clear() {
        text = nil
    }
    
    func changeMeasuringIcon() {
        let iconImage = UIImage(named: defaults.isImperialCalculator ? "in.png" : "mm.png")
        setIcon(iconImage!)
    }
}
