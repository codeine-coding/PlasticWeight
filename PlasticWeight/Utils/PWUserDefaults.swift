//
//  PWUserDefaults.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import Foundation

enum CalculatorType: Int {
    case Imperial = 0
    case Metric = 1
    
    var name: String {
        switch self {
        case .Imperial:
            return "Imperial"
        case .Metric:
            return "Metric"
        }
    }
}

final class PWUserDefaults {
    
    static let shared = PWUserDefaults()
    
    private let calculatorTypeString = "calculatorType"
    
    var isDefaultCalculatorSet: Bool {
        get {
            if getCalculatorType() == nil {
                return false
            }
            return true
        }
    }
    
    var isImperialCalculator: Bool {
        get {
            if isDefaultCalculatorSet {
                guard let calcType = getCalculatorType() else { fatalError() }
                switch calcType {
                case "Imperial":
                    return true
                case "Metric":
                    return false
                default:
                    break
                }
            }
            return true
        }
    }
    
    private init() {}
    
    func set(calculatorType: CalculatorType) {
        UserDefaults.standard.set(calculatorType.name, forKey: calculatorTypeString)
    }
    
    func getCalculatorType() -> String? {
        return UserDefaults.standard.object(forKey: calculatorTypeString) as? String
    }
}
