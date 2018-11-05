//
//  FormControl.swift
//  FormControl
//
//  Created by Allen Whearry on 10/30/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

protocol FormControl {
    var titleForLabel: String? { get }
    
    func clear()
}
