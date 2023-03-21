//
//  RoundedButton.swift
//  Effective mobile
//
//  Created by Denis Klimov on 10.03.2023.
//

import UIKit

class RoundedButton: UIButton {
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
       layer.cornerRadius = frame.height / 3
       clipsToBounds = true
        
    }
}
