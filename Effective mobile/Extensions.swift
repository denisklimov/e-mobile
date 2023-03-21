//
//  Extensions.swift
//  Effective mobile
//
//  Created by Denis Klimov on 17.03.2023.
//

import Foundation
import UIKit

extension String {
    var isEmail: Bool {
        let regExp = "^[A-Za-z0-9]+[_.]?[A-Z-a-z0-9]+@[A-Za-z0-9-]{2,}.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return predicate.evaluate(with: self)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
