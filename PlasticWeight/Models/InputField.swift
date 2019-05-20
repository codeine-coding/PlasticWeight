//
//  InputField.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 5/20/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import Foundation

enum InputField {
    case thickness, width, length, diameter, outerDiameter, outerSquareWidth, wall

    var title: String {
        switch self {
        case .thickness:
            return "(T)hickness"
        case .width:
            return "(W)idth"
        case .length:
            return "(L)ength"
        case .diameter:
            return "(D)iameter"
        case .outerDiameter:
            return "(O)uter (D)iameter"
        case .outerSquareWidth:
            return "(O)uter (S)q. Width"
        case .wall:
            return "(W)all"
        }
    }
}
