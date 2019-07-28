//
//  MainTabBarControllerTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class MainTabBarControllerTests: XCTestCase {
    var sut: MainTabBarController!

    override func setUp() {
        sut = MainTabBarController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    // Make sure tab controllers are not nil
    func test_SheetBarViewController_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.sheetBarViewController)
    }
    
    func test_RodViewController_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.rodViewController)
    }
    
    func test_RoundTubeViewController_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.roundTubeViewController)
    }
    
    func test_SquareTubeViewController_AfterViewDidLoadIsNotNil() {
        XCTAssertNotNil(sut.squareTubeViewController)
    }
    
    
    // Make sure each tabbare view controller's root vc is of its own type
    func test_SheetBarViewControllerRootViewController_IsSheetBarViewController() {
        let rootViewController = sut.sheetBarViewController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is SheetBarViewController)
    }
    
    func test_RodViewControllerRootViewController_IsRodViewController() {
        let rootViewController = sut.rodViewController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is RodViewController)
    }
    
    func test_RoundTubeViewControllerRootViewController_IsRoundTubeViewController() {
        let rootViewController = sut.roundTubeViewController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is RoundTubeViewController)
    }
    
    func test_SquareTubeiewControllerRootViewController_IsSquareTubeViewController() {
        let rootViewController = sut.squareTubeViewController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is SquareTubeViewController)
    }
    
    
    // Make sure controllers are within tabbar's view controllers array
    func test_MainTabController_ContainsSheetBarViewController() {
        guard let viewControllers = sut.viewControllers else { return }
        XCTAssertTrue((viewControllers.contains(sut.sheetBarViewController)))
    }
    
    func test_ContainsRodViewController() {
        guard let viewControllers = sut.viewControllers else { return }
        XCTAssertTrue((viewControllers.contains(sut.rodViewController)))
    }
    
    func test_ContainsRoundTubeViewController() {
        guard let viewControllers = sut.viewControllers else { return }
        XCTAssertTrue((viewControllers.contains(sut.roundTubeViewController)))
    }
    
    func test_ContainsSquareTubeViewController() {
        guard let viewControllers = sut.viewControllers else { return }
        XCTAssertTrue((viewControllers.contains(sut.squareTubeViewController)))
    }
    
    
    // Make sure each view controller's tab has a title
    func test_SheetBarViewControllerTab_HasTitle() {
        XCTAssertEqual(sut.sheetBarViewController.title, "Sheet / Bar")
    }
    
    func test_RodViewControllerTab_HasTitle() {
        XCTAssertEqual(sut.rodViewController.title, "Rod")
    }
    
    func test_RoundTubeViewController_HasTitle() {
        XCTAssertEqual(sut.roundTubeViewController.title, "Round Tube")
    }
    
    func test_SquareTubeViewController_HasTitle() {
        XCTAssertEqual(sut.squareTubeViewController.title, "Square Tube")
    }
    
    
    // make sure each view contrller's tab has an image
    func test_SheetBarViewController_HasImage() {
        XCTAssertNotNil(sut.sheetBarViewController.tabBarItem?.image)
    }
    
    func test_RodViewController_HasImage() {
        XCTAssertNotNil(sut.rodViewController.tabBarItem?.image)
    }
    
    func test_RoundTubeViewController_HasImage() {
        XCTAssertNotNil(sut.roundTubeViewController.tabBarItem?.image)
    }
    
    func test_SquareTubeViewController_HasImage() {
        XCTAssertNotNil(sut.squareTubeViewController.tabBarItem?.image)
    }
    

}
