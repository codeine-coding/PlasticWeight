//
//  BaseMaterialTypeViewController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class BaseMaterialTypeViewController: UIViewController, UniversalViewDelegate, ErrorDisplayer   {
    var calculator: WeightCalculatorType
    
    let calculatorChangeNotification = NotificationCenter.default
    
    init(calculator: WeightCalculatorType) {
        self.calculator = calculator
        super.init(nibName: nil, bundle: nil)
        calculatorChangeNotification.addObserver(self, selector: #selector(receiveNotification(notification:)), name: NSNotification.Name(CalculatorNotificationName), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        calculatorChangeNotification.removeObserver(self)
    }
    
    func setupView() {
        let settingsBtn = UIBarButtonItem(image: UIImage(named: "settings"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingsBtnPressed))
        settingsBtn.tintColor = .white
        settingsBtn.accessibilityLabel = "Settings Button"
        navigationItem.rightBarButtonItem = settingsBtn
        
        let scrrenWidth = UIScreen.main.bounds.width
        if scrrenWidth <= 320 {
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
            navigationController?.navigationBar.largeTitleTextAttributes = attributes
        }
    }
    
    @objc func settingsBtnPressed() {
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController(nibName: "SettingsViewController", bundle: nil))
        settingsViewController.navigationBar.prefersLargeTitles = false
        present(settingsViewController, animated: true, completion: nil)
    }
    
    @objc func receiveNotification(notification: Notification) {
        guard let recievedCalculator = notification.userInfo?["calculator"] as? CalculatorType else { return }
        
        switch recievedCalculator {
        case .Imperial:
            calculator = ImperialWeightCalculator()
        case .Metric:
            calculator = MetricWeightCalculator()
        }
    }
}
