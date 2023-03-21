//
//  RoundedLabel.swift
//  Effective mobile
//
//  Created by Denis Klimov on 21.03.2023.
//

import UIKit

class RoundedLabel: UILabel {

    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }

}
