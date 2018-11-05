//
//  DimensionLabel.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/5/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class DimensionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .primary
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        numberOfLines = 2
        font = UIFont.systemFont(ofSize: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
