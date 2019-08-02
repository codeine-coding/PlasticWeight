//
//  MainTabBarController.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    var sheetBarViewController: UINavigationController!
    var rodViewController: UINavigationController!
    var roundTubeViewController: UINavigationController!
    var squareTubeViewController: UINavigationController!
    var settingsViewController: SettingsViewController!

    var calculator: WeightCalculatorType!
    
    let defaults = PWUserDefaults.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tabBar.tintColor = .secondary
        tabBar.isTranslucent = false
        
        calculator = defaults.isImperialCalculator ? ImperialWeightCalculator() : MetricWeightCalculator()
        
        sheetBarViewController = UINavigationController(rootViewController: SheetBarViewController(calculator: calculator))
        sheetBarViewController.title = TitleStrings.sheet
        sheetBarViewController.tabBarItem.image = UIImage(named: "TabBar/sheet")
        sheetBarViewController.tabBarItem.tag = 0
        
        rodViewController = UINavigationController(rootViewController: RodViewController(calculator: calculator))
        rodViewController.title = TitleStrings.rod
        rodViewController.tabBarItem.image = UIImage(named: "TabBar/rod")
        rodViewController.tabBarItem.tag = 1
        
        roundTubeViewController = UINavigationController(rootViewController: RoundTubeViewController(calculator: calculator))
        roundTubeViewController.title = TitleStrings.roundTube
        roundTubeViewController.tabBarItem.image = UIImage(named: "TabBar/roundTube")
        roundTubeViewController.tabBarItem.tag = 2
        
        squareTubeViewController = UINavigationController(rootViewController: SquareTubeViewController(calculator: calculator))
        squareTubeViewController.title = TitleStrings.squareTube
        squareTubeViewController.tabBarItem.image = UIImage(named: "TabBar/squareTube")
        squareTubeViewController.tabBarItem.tag = 3
        
        
        viewControllers = [sheetBarViewController, rodViewController,
                           roundTubeViewController, squareTubeViewController]
    }

}
