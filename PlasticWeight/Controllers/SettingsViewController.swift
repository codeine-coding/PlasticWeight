//
//  SettingsViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

let CalculatorNotificationName = "CalculatorChangeNotification"

class SettingsViewController: UIViewController {
    @IBOutlet weak var calculatorSegmentedControl: UISegmentedControl!
    
    let calculatorChangeNotification = NotificationCenter.default
    
    let defaults = PWUserDefaults.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneBtnPressed))
        doneBtn.tintColor = .white
        navigationItem.leftBarButtonItem = doneBtn
        calculatorSegmentedControl.tintColor = UIColor.primary
        calculatorSegmentedControl.selectedSegmentIndex = defaults.isImperialCalculator ? 0 : 1
    }


    @IBAction func segmentedControllValueChanged(_ sender: UISegmentedControl) {
        if defaults.isDefaultCalculatorSet {
            print("UserDefault value is set")
        } else {
            print("UserDefault = nil")
        }
        
        guard let selectedSegmentIndex = CalculatorType(rawValue: sender.selectedSegmentIndex) else { fatalError() }
        switch selectedSegmentIndex {
        case .Imperial:
            defaults.set(calculatorType: .Imperial)
            print("Selected Imperial Calculator")
            calculatorChangeNotification.post(name: Notification.Name(rawValue: CalculatorNotificationName), object: nil, userInfo: ["calculator" : CalculatorType.Imperial])
        case .Metric:
            defaults.set(calculatorType: .Metric)
            print("Selected Metric Calculator")
            calculatorChangeNotification.post(name: Notification.Name(rawValue: CalculatorNotificationName), object: nil, userInfo: ["calculator" : CalculatorType.Metric])
        }
    }
    
    @objc func doneBtnPressed() {
        dismiss(animated: true, completion: nil)
    }

}
