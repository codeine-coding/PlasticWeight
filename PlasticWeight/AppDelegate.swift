//
//  AppDelegate.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationAppearance = UINavigationBar.appearance()
        navigationAppearance.barTintColor = .primary
        navigationAppearance.prefersLargeTitles = true
        navigationAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .secondary
        window?.makeKeyAndVisible()
        let mainTabController = MainTabBarController()
        window?.rootViewController = mainTabController
        
        // logo mask
        let mainTablLayer = mainTabController.view.layer
        mainTablLayer.mask = CALayer()
        mainTablLayer.mask?.contents = UIImage(named: "scale.png")?.cgImage
        mainTablLayer.mask?.bounds = CGRect(x: 0, y: 0, width: 124, height: 150)
        mainTablLayer.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mainTablLayer.mask?.position = CGPoint(x: mainTabController.view.frame.width / 2, y: mainTabController.view.frame.height / 2)
        
        // logo mask background view
        let maskBGView = UIView(frame: mainTabController.view.frame)
        maskBGView.backgroundColor = UIColor.white
        mainTabController.view.addSubview(maskBGView)
        mainTabController.view.bringSubviewToFront(maskBGView)
        
        // logo mask animation
        let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
        transformAnimation.duration = 1
        transformAnimation.beginTime = CACurrentMediaTime() + 1 //add delay of 1 second
        let initalBounds = NSValue(cgRect: (mainTabController.view.layer.mask?.bounds)!)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 83, height: 100))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 3024))
        transformAnimation.values = [initalBounds, secondBounds, finalBounds]
        transformAnimation.keyTimes = [0, 0.5, 1]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        transformAnimation.isRemovedOnCompletion = false
        transformAnimation.fillMode = CAMediaTimingFillMode.forwards
        mainTabController.view.layer.mask?.add(transformAnimation, forKey: "maskAnimation")
        
        // logo mask background view animation
        UIView.animate(withDuration: 0.1,
                       delay: 1.35,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        maskBGView.alpha = 0.0
        },
                       completion: { finished in
                        maskBGView.removeFromSuperview()
        })
        
        return true
    }

}

