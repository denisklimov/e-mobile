//
//  LoginViewController.swift
//  Effective mobile
//
//  Created by Denis Klimov on 10.03.2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
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
        }
        return false
    }

    func login() {
        if usersCoreData.auth(login: loginTextField.text!, password: passwordTextField.text!) {
            performSegue(withIdentifier: "loginToPageOneSegue", sender: nil)
            UserDefaults.standard.set(true, forKey: "isAuthorized")
        } else {
            alertError(error: "Wrong login or password")
        }
    }
}

