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
            Plastic(title: NSLocalizedString("Nylon", comment: "Nylon"), factor: 0.041, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Acrylic", comment: "Acrylic"), factor: 0.0436, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Polycarbonate", comment: "Polycarbonate"), factor: 0.0436, specificGravity: 0.0),
            Plastic(title: "PETG", factor: 0.0465, specificGravity: 0.0),
            Plastic(title: "HIPS", factor: 0.039, specificGravity: 0.0),
            Plastic(title: "Mylar/Melinax Film", factor: 0.05, specificGravity: 0.0),
            Plastic(title: "Calendard Vinyl", factor: 0.051, specificGravity: 0.0),
            Plastic(title: "ABS", factor: 0.0376, specificGravity: 0.0),
            Plastic(title: "APVC", factor: 0.05, specificGravity: 0.0),
            Plastic(title: "Acetal", factor: 0.051, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Expanded/Foam PVC (FPVC)", comment: "Expanded/Foam PVC (FPVC)"), factor: 0.028, specificGravity: 0.0),
            Plastic(title: "UHMW", factor: 0.034, specificGravity: 0.0),
            Plastic(title: "HDPE", factor: 0.036, specificGravity: 0.0),
            Plastic(title: "LDPE", factor: 0.034, specificGravity: 0.0),
            Plastic(title: "PVC", factor: 0.051, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Polypropylene", comment: "Polypropylene"), factor: 0.033, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Urethane", comment: "Urethane"), factor: 0.043, specificGravity: 0.0),
            Plastic(title: "PEI (Ultem)", factor: 0.046, specificGravity: 0.0),
            Plastic(title: "Noryl", factor: 0.0407, specificGravity: 0.0),
            Plastic(title: "PVDF", factor: 0.063, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Phenolic C or CE", comment: "Phenolic C or CE"), factor: 0.0515, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Phenolic L or LE", comment: "Phenolic L or LE"), factor: 0.051, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Phenolic X or XX", comment: "Phenolic X or XX"), factor: 0.049, specificGravity: 0.0),
            Plastic(title: "PTFE", factor: 0.076, specificGravity: 0.0),
            Plastic(title: NSLocalizedString("Acetate", comment: "Acetate"), factor: 0.04881, specificGravity: 0.0)
        ].sorted(by: { $0.title < $1.title }))
    }
}
