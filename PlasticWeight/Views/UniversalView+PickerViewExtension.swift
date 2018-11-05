//
//  UniversalView+PickerViewExtension.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

extension UniversalView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return plasticManager.materials.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let material = plasticManager.materials[row]
        selectedMaterial = material.title
        selectedMaterialFactor = material.factor
        materialTextField.text = selectedMaterial
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textAlignment = .center
        label.text = plasticManager.materials[row].title
        label.textColor = .primary
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }
    
    
}
