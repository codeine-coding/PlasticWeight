//
//  Form.swift
//  FormControl
//
//  Created by Allen Whearry on 10/30/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import Foundation

class Form: NSObject {
    var controls: [FormControl]?
    
    init(controls: [FormControl]?) {
        self.controls = controls
    }
    
    subscript(_ key: String) -> String? {
        return value(for: key)
    }
    
    func value(for key: String) -> String? {
        return controls?.first(where: { $0.key == key})?.text
    }
    
    func clear() {
        controls?.forEach { $0.clear() }
    }
}
