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
            return InputFieldStrings.thickness
        case .width:
            return InputFieldStrings.width
        case .length:
            return InputFieldStrings.length
        case .diameter:
            return InputFieldStrings.diameter
        case .outerDiameter:
            return InputFieldStrings.outerDiameter
        case .outerSquareWidth:
            return InputFieldStrings.outerSquareWidth
        case .wall:
            return InputFieldStrings.wall
        }
    }
}
