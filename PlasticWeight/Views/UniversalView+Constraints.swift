//
//  UniversalView+Constraints.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

extension UniversalView {
    
    func displayConstraints() {
        let safeArea = safeAreaLayoutGuide
        let imageWidth = UIScreen.main.bounds.width - 32
        let screenWdith = imageWidth + 32
        
        sharedConstraints.append(contentsOf: [
            materialChoiceStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            materialChoiceStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            materialChoiceStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            dimensionsStackView.topAnchor.constraint(equalTo: materialChoiceStackView.bottomAnchor, constant: 16),
            dimensionsStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            dimensionsStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            materialTypeImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weightPoundStackView.centerXAnchor.constraint(equalTo: materialTypeImage.centerXAnchor),
            weightPoundStackView.widthAnchor.constraint(equalToConstant: imageWidth),
            ])
        
        greaterThanSEConstraints.append(contentsOf: [
            materialTypeImage.topAnchor.constraint(equalTo: dimensionsStackView.topAnchor, constant: 32),
            materialTypeImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.80),
            
            weightPoundStackView.centerYAnchor.constraint(equalTo: materialTypeImage.centerYAnchor),
            
            buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 120),
            ])
        
        SEConstraints.append(contentsOf: [
            materialTypeImage.topAnchor.constraint(equalTo: dimensionsStackView.topAnchor, constant: 8),
            materialTypeImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.60),
            
            weightPoundStackView.centerYAnchor.constraint(equalTo: materialTypeImage.centerYAnchor, constant: -24),
            
            buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 96),
            ])
        
        NSLayoutConstraint.activate(sharedConstraints)
        
        if screenWdith <= 320 {
            NSLayoutConstraint.activate(SEConstraints)
        } else {
            NSLayoutConstraint.activate(greaterThanSEConstraints)
        }
    }
}
