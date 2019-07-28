//
//  ErrorDisplayer.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/28/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

protocol ErrorDisplayer: class {
    func showError(for errorMessge: String)
}

extension ErrorDisplayer where Self: UIViewController {
    func showError(for errorMessge: String) {
        let ac = UIAlertController(title: "Error", message: errorMessge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.secondary, forKey: "titleTextColor")
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }
}
