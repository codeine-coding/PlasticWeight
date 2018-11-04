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
    
    
    // Make sure controllers are within tabbar's view controllers array
    func test_MainTabController_ContainsSheetBarViewController() {
        XCTAssertTrue((sut.viewControllers?.contains(sut.sheetBarViewController)) ?? false)
    }
    
    func test_ContainsRodViewController() {
        XCTAssertTrue((sut.viewControllers?.contains(sut.rodViewController)) ?? false)
    }
    
    func test_ContainsRoundTubeViewController() {
        XCTAssertTrue((sut.viewControllers?.contains(sut.roundTubeViewController)) ?? false)
    }
    
    func test_ContainsSquareTubeViewController() {
        XCTAssertTrue((sut.viewControllers?.contains(sut.squareTubeViewController)) ?? false)
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
