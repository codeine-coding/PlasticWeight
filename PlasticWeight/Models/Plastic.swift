//
//  Plastic.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

struct Plastic {
    public private(set) var title: String
    public private(set) var factor: Double
    public private(set) var specificGravity: Double

    
    init(title: String, factor: Double, specificGravity: Double) {
        self.title = title
        self.factor = factor
        self.specificGravity = specificGravity
    }
}
