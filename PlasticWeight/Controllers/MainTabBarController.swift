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
        sheetBarViewController = UINavigationController(rootViewController: UIViewController())
        sheetBarViewController.title = "Sheet / Bar"
        sheetBarViewController.tabBarItem.image = UIImage(named: "TabBar/sheet")
        
        rodViewController = UINavigationController(rootViewController: UIViewController())
        rodViewController.title = "Rod"
        rodViewController.tabBarItem.image = UIImage(named: "TabBar/rod")
        
        roundTubeViewController = UINavigationController(rootViewController: UIViewController())
        roundTubeViewController.title = "Round Tube"
        roundTubeViewController.tabBarItem.image = UIImage(named: "TabBar/roundTube")
        
        squareTubeViewController = UINavigationController(rootViewController: UIViewController())
        squareTubeViewController.title = "Square Tube"
        squareTubeViewController.tabBarItem.image = UIImage(named: "TabBar/squareTube")
        
        viewControllers = [sheetBarViewController, rodViewController,
                           roundTubeViewController, squareTubeViewController]
    }

}
