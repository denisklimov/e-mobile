//
//  RoundedTextField.swift
//  Effective mobile
//
//  Created by Denis Klimov on 10.03.2023.
//

import UIKit

class RoundedTextField: UITextField {
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        layer.cornerRadius = frame.height / 2
    }

}
