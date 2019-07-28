//
//  ErrorMessages.swift
//  Plastic Weight Calc
//
//  Created by Allen Whearry on 10/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

struct ErrorMessage {
    static let noMaterialSelectedErrorMessage = NSLocalizedString("Please select material", comment: "no material error")
    static let zeroValueErrorMessage = NSLocalizedString("No field can be zero", comment: "zero value error")
    static let invalidInputErrorMessage = NSLocalizedString("Invalid field inputs", comment: "invalid input error message")
    static let wallGreaterThanErrorMessage = NSLocalizedString("Wall cannot be greater than ", comment: "Wall greater than error")
    static let unexpectedErrorMessage = NSLocalizedString("Unexpected error", comment: "unexpected error")
}
