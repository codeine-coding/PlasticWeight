//
//  Plastic.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/3/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

struct Plastic {
    public private(set) var title: String
    public private(set) var factor: Double
    
    public static let materials = [
        Plastic(title: "", factor: 0.0),
        Plastic(title: "Nylon", factor: 0.041),
        Plastic(title: "Acrylic", factor: 0.0436),
        Plastic(title: "Polycarbonate", factor: 0.0436),
        Plastic(title: "PETG", factor: 0.0465),
        Plastic(title: "HIPS", factor: 0.039),
        Plastic(title: "Mylar/Melinax Film", factor: 0.05),
        Plastic(title: "Calendard Vinyl", factor: 0.051),
        Plastic(title: "ABS", factor: 0.0376),
        Plastic(title: "APVC", factor: 0.05),
        Plastic(title: "Acetal", factor: 0.051),
        Plastic(title: "Expanded/Foam PVC (FPVC)", factor: 0.028),
        Plastic(title: "UHMW", factor: 0.034),
        Plastic(title: "HDPE", factor: 0.036),
        Plastic(title: "LDPE", factor: 0.034),
        Plastic(title: "PVC", factor: 0.051),
        Plastic(title: "Polypropylene", factor: 0.033),
        Plastic(title: "Urethane", factor: 0.043),
        Plastic(title: "PEI (Ultem)", factor: 0.046),
        Plastic(title: "Noryl", factor: 0.0407),
        Plastic(title: "PVDF", factor: 0.063),
        Plastic(title: "Phenolic C or CE", factor: 0.0515),
        Plastic(title: "Phenolic L or LE", factor: 0.051),
        Plastic(title: "Phenolic X or XX", factor: 0.049),
        Plastic(title: "PTFE", factor: 0.076),
        Plastic(title: "Acetate", factor: 0.04881)
    ]
    
    init(title: String, factor: Double) {
        self.title = title
        self.factor = factor
    }
}
