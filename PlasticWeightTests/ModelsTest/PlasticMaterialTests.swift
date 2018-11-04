//
//  PlasticMaterialTests.swift
//  PlasticWeightTests
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import XCTest
@testable import PlasticWeight

class PlasticMaterialTests: XCTestCase {
    var plasticManager: PlasticManager!

    override func setUp() {
        plasticManager = PlasticManager()
    }

    override func tearDown() {
        plasticManager = nil
    }
    
    func test_Init_SetsTitleAndFactor() {
        let material = Plastic(title: "Acrylic", factor: 0.0436)
        XCTAssertEqual(material.title, "Acrylic")
        XCTAssertEqual(material.factor, 0.0436)
    }
    
    func test_PlasticManagerMaterials_OnInit_IsNotEmpty() {
        XCTAssertFalse(plasticManager.materials.isEmpty)
    }
    
    func test_PlasticManagerMaterials_IsSortedByTitle() {
        let firstMaterial = plasticManager.materials[0].title
        let secondMaterial = plasticManager.materials[1].title
        
        XCTAssertTrue(firstMaterial < secondMaterial)
    }
    
    

}
