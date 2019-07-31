//
//  WeightCalculatorType.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 7/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import Foundation

protocol WeightCalculatorType {
    func calculateSheet(densityMesure: Double, thickness: String, width: String, length: String) throws -> Double
    func calculateRoundRod(densityMesure: Double, diameter: String, length: String ) throws -> Double
    func calculateRoundTube(densityMesure: Double, outsideDiameter: String, wall: String, length: String) throws -> Double
    func calculateSquareTube(densityMesure: Double, outsideSquareWidth: String, wall: String, length: String) throws -> Double
}
