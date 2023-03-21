//
//  AlertManager.swift
//  Effective mobile
//
//  Created by Denis Klimov on 17.03.2023.
//

import Foundation
import UIKit

class AlertManager {
    var viewController: UIViewController
    
    func error(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.viewController.present(alertController, animated: true)
        }
    }
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
