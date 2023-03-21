//
//  GradientView.swift
//  Effective mobile
//
//  Created by Denis Klimov on 20.03.2023.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        let gradient = CAGradientLayer()
        let topColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        let bottomColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        gradient.frame = self.bounds
        gradient.colors = [topColor, bottomColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
