//
//  SearchTextField.swift
//  Effective mobile
//
//  Created by Denis Klimov on 04.04.2023.
//

import UIKit

class SearchTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        let searchImage = UIImage(systemName: "magnifyingglass")
        let imageView = UIImageView(image: searchImage)
    
        layer.cornerRadius = frame.height / 2
        backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.969, alpha: 1)
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: frame.height))
        rightViewMode = .always
        rightView?.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 5, width: (imageView.superview?.frame.width)! - 10, height: (imageView.superview?.frame.height)! - 10)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 0.357, green: 0.357, blue: 0.357, alpha: 1)
  
    }
    
}
