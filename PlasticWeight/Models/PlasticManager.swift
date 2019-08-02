//
//  PlasticManager.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

class PlasticManager {
    var materials = [Plastic]()
    
    init() {
        materials.append(contentsOf: [
            Plastic(title: "", factor: 0.0, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Nylon", comment: "Nylon"), factor: 0.0415, specificGravity: 1.14),
            Plastic(title: NSLocalizedString("Acrylic", comment: "Acrylic"), factor: 0.0436, specificGravity: 1.206850341),
            Plastic(title: NSLocalizedString("Polycarbonate", comment: "Polycarbonate"), factor: 0.0436, specificGravity: 1.21),
            Plastic(title: "PETG", factor: 0.0465, specificGravity: 1.27),
            Plastic(title: "HIPS", factor: 0.0376, specificGravity: 1.04),
            Plastic(title: "Mylar/Melinax Film", factor: 0.05, specificGravity: 1.39),
            Plastic(title: "Calendard Vinyl", factor: 0.051, specificGravity: 1.322),
            Plastic(title: "ABS", factor: 0.0376, specificGravity: 1.02),
            Plastic(title: "Acetal", factor: 0.051, specificGravity: 1.412),
            Plastic(title: NSLocalizedString("Expanded/Foam PVC (FPVC)", comment: "Expanded/Foam PVC (FPVC)"), factor: 0.028, specificGravity: 0.58),
            Plastic(title: "UHMW", factor: 0.0339, specificGravity: 0.94),
            Plastic(title: "HDPE", factor: 0.0346, specificGravity: 0.959),
            Plastic(title: "LDPE", factor: 0.0334, specificGravity: 0.925),
            Plastic(title: "PVC", factor: 0.051, specificGravity: 1.4),
            Plastic(title: "PVC - APVC", factor: 0.05, specificGravity: 1.4),
            Plastic(title: "PVC - CPVC", factor: 0.056, specificGravity: 1.550),
            Plastic(title: NSLocalizedString("Polypropylene", comment: "Polypropylene"), factor: 0.0327, specificGravity: 0.905),
            Plastic(title: NSLocalizedString("Urethane", comment: "Urethane"), factor: 0.043, specificGravity: 1.21),
            Plastic(title: "PEI (Ultem)", factor: 0.0462, specificGravity: 1.28),
            Plastic(title: "Noryl", factor: 0.038, specificGravity: 1.08),
            Plastic(title: "PVDF", factor: 0.064, specificGravity: 1.78),
            Plastic(title: NSLocalizedString("Phenolic C or CE", comment: "Phenolic C or CE"), factor: 0.0515, specificGravity: 1.36),
            Plastic(title: NSLocalizedString("Phenolic L or LE", comment: "Phenolic L or LE"), factor: 0.048, specificGravity: 1.34),
            Plastic(title: NSLocalizedString("Phenolic X or XX", comment: "Phenolic X or XX"), factor: 0.049, specificGravity: 1.35),
            Plastic(title: "PTFE", factor: 0.0783, specificGravity: 2.16),
            Plastic(title: NSLocalizedString("PTFE - 25% Glass Filled", comment: "glass filled"), factor: 0.081, specificGravity: 2.25),
            Plastic(title: NSLocalizedString("PTFE - 25% Carbon Filled", comment: "carbon filled"), factor: 0.075, specificGravity: 2.08),
            Plastic(title: "PEEK", factor: 0.0473, specificGravity: 1.31),
            Plastic(title: NSLocalizedString("Acetate", comment: "Acetate"), factor: 0.04881, specificGravity: 1.35)
        ].sorted(by: { $0.title < $1.title }))
    }
}
