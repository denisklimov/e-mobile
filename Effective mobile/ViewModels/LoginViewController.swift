//
//  LoginViewController.swift
//  Effective mobile
//
//  Created by Denis Klimov on 10.03.2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    lazy var alertManager: AlertManager = AlertManager(viewController: self)
    let usersCoreData: CoreDataUserManager = CoreDataUserManager()
    @IBOutlet weak var loginTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func loginButtonAction() {
        login()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) {
            nextTextField.becomeFirstResponder()
        } else {
            login()
           // textField.resignFirstResponder()
        }
        return false
    }

    func login() {
//      performSegue(withIdentifier: "loginToPageOneSegue", sender: nil)
//      UserDefaults.standard.set(true, forKey: "isAuthorized")
        if usersCoreData.auth(login: loginTextField.text!, password: passwordTextField.text!) {
            performSegue(withIdentifier: "loginToPageOneSegue", sender: nil)
            UserDefaults.standard.set(true, forKey: "isAuthorized")
        } else {
            alertManager.error(message: "Wrong login or password")
        }
    }
    
 
    
}

