//
//  Form.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 5/20/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import Foundation

class Form: NSObject {
    var controls: [FormControl]?

    subscript(_ key: InputField) -> String {
        guard let text = controls?.first(where: { $0.inputType == key})?.text else { return "" }
        return text
    }

    func clear() {
        controls?.forEach({ $0.clear() })
    }

}

protocol FormControl {
    var text: String? { get }
    var inputType: InputField? { get }

    func clear()
}
