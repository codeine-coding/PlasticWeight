//
//  CalculationError.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

/// Errors which may occur during calculation of material weight
///
/// - zeroValue: Zero is passed to any of calculations arguments
/// - invalidInput: Input provided cannot be cast to a Double
/// - wallGreaterThanOutterField: Tube material's wall thickness is greater than the ouuter diameter or square width.
enum CalculationError: Error {
    case zeroValue
    case invalidInput
    case wallDoubledGreaterThanOrEqualToOutterField(outterField: String)
}

extension CalculationError: Equatable {
    
    static func == (lhs: CalculationError, rhs: CalculationError) -> Bool {
        switch (lhs, rhs) {
        case (.zeroValue, .zeroValue):
            return true
        case (.invalidInput, .invalidInput):
            return true
        case (.wallDoubledGreaterThanOrEqualToOutterField, .wallDoubledGreaterThanOrEqualToOutterField):
            return true
        default:
            return false
        }
    }
}
