//
//  Extensions.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

extension Double {
    var roundMax3DecimalPlaces: Double {
        return Darwin.round(self * 1000.0) / 1000
    }
}
