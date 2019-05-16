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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tabBar.tintColor = .secondary
        tabBar.isTranslucent = false
        
        sheetBarViewController = UINavigationController(rootViewController: MainViewController())
        sheetBarViewController.title = "Sheet / Bar"
        sheetBarViewController.tabBarItem.image = UIImage(named: "TabBar/sheet")
        sheetBarViewController.tabBarItem.tag = 0
        
        rodViewController = UINavigationController(rootViewController: MainViewController())
        rodViewController.title = "Rod"
        rodViewController.tabBarItem.image = UIImage(named: "TabBar/rod")
        rodViewController.tabBarItem.tag = 1
        
        roundTubeViewController = UINavigationController(rootViewController: MainViewController())
        roundTubeViewController.title = "Round Tube"
        roundTubeViewController.tabBarItem.image = UIImage(named: "TabBar/roundTube")
        roundTubeViewController.tabBarItem.tag = 2
        
        squareTubeViewController = UINavigationController(rootViewController: MainViewController())
        squareTubeViewController.title = "Square Tube"
        squareTubeViewController.tabBarItem.image = UIImage(named: "TabBar/squareTube")
        squareTubeViewController.tabBarItem.tag = 3
        
        viewControllers = [sheetBarViewController, rodViewController,
                           roundTubeViewController, squareTubeViewController]
    }

}
