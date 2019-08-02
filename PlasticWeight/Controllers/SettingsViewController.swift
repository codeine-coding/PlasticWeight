//
//  SettingsViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit
import MessageUI

let CalculatorNotificationName = "CalculatorChangeNotification"

class SettingsViewController: UIViewController {
    @IBOutlet weak var calculatorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var developerImage: UIImageView!
    @IBOutlet weak var emailMeBtn: RadiusButton!
    @IBOutlet weak var shareAppBtn: RadiusButton!
    
    let calculatorChangeNotification = NotificationCenter.default
    
    let defaults = PWUserDefaults.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneBtnPressed))
        doneBtn.tintColor = .white
        navigationItem.leftBarButtonItem = doneBtn
        calculatorSegmentedControl.selectedSegmentIndex = defaults.isImperialCalculator ? 0 : 1
        developerImage.layer.cornerRadius = 45
        developerImage.layer.borderColor = UIColor.primary.cgColor
        developerImage.layer.borderWidth = 2.0
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
    @IBAction func emailMeBtnPressed(_ sender: Any) {
        guard MFMailComposeViewController.canSendMail() else {
            showError(for: "Mail Services are not available!")
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients(["allen@codeinecoding.com"])
        composeVC.setSubject("I Love this app!")
        composeVC.setMessageBody("Here are my questions and suggestions:", isHTML: false)
        self.present(composeVC, animated: true, completion: nil)
        
    }
    @IBAction func shareAppBtnPressed(_ sender: Any) {
        guard MFMessageComposeViewController.canSendText() else {
            showError(for: "SMS services are not available")
            return
        }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.body = """
        Check out this Plastic Weight Calculator:
        
        https://apps.apple.com/us/app/plastic-weight/id1441487729
        """
        
    }
    
}

extension SettingsViewController: MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, ErrorDisplayer {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        guard error == nil else {
            controller.dismiss(animated: true) { [weak self] in
                self?.showError(for: error!.localizedDescription)
            }
            return
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}
