//
//  Extensions.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

extension Double {
    var roundMax3DecimalPlaces: Double {
        return Darwin.round(self * 1000.0) / 1000
    }
}

extension UIColor {
    static var primary: UIColor {
        return #colorLiteral(red: 0.3313614726, green: 0.1370666325, blue: 0.4729859829, alpha: 1)
    }
    
    static var secondary: UIColor {
        return #colorLiteral(red: 0.5725490196, green: 0.1529411765, blue: 0.5607843137, alpha: 1)
    }
    
    static var error: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
}

extension UIView {
    /// Function to add error styling to a label.
    ///
    /// - Parameters:
    ///   - label: Label to be converter to an error label.
    ///   - hiddenLabel: Label that should be hidden when error message displays.
    ///   - errorMessge: Error message to display on label.
//    func errorLabel(for label: UILabel, hiddenLabel: UILabel, errorMessge: String) {
//        label.textColor = .error
//        label.text = errorMessge
//        hiddenLabel.isHidden = true
//    }
    
    func edgeToEdgeConstraints(in view: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension UIViewController {
    func showError(for errorMessge: String) {
        let ac = UIAlertController(title: "Error", message: errorMessge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.secondary, forKey: "titleTextColor")
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
}

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
