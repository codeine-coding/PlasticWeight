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

private struct InputFieldStrings {
    static let thickness = NSLocalizedString("(T)hickness", comment: "(T)hickness")
    static let width = NSLocalizedString("(W)idth", comment: "(W)idth")
    static let length = NSLocalizedString("(L)ength", comment: "(L)ength")
    static let diameter = NSLocalizedString("(D)iameter", comment: "(D)iameter")
    static let outerDiameter = NSLocalizedString("(O)uter (D)iameter", comment: "(O)uter (D)iameter")
    static let outerSquareWidth = NSLocalizedString("(O)uter (D)iameter", comment: "(O)uter (S)q. Width")
    static let wall = NSLocalizedString("(W)all", comment: "(W)all")
}
