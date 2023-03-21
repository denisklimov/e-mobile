//
//  SignInViewController.swift
//  Effective mobile
//
//  Created by Denis Klimov on 17.03.2023.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    lazy var alertManager: AlertManager = AlertManager(viewController: self)
    let usersCoreData: CoreDataUserManager = CoreDataUserManager()
    @IBOutlet weak var passwordTextField: RoundedTextField!
    @IBOutlet weak var loginTextField: RoundedTextField!
    @IBOutlet weak var emailTextField: RoundedTextField!
    
    override func viewDidAppear(_ animated: Bool) {
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        if UserDefaults.standard.bool(forKey: "isAuthorized") {
            performSegue(withIdentifier: "signInToPageOneSegue", sender: nil)
        }
        
    }
    
    @IBAction func signInAction() {
       signIn()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) {
            nextTextField.becomeFirstResponder()
        } else {
            signIn()
        }
        return false
    }
    
    func signIn() {
        guard loginTextField.text != "" else {
            alertManager.error(message: "Login is empty")
            return
        }
        guard passwordTextField.text != "" else {
            alertManager.error(message: "Passsword is empty")
            return
        }
        guard emailTextField.text!.isEmail else {
            alertManager.error(message: "Invalid e-mail format")
            return
        }
        
        if usersCoreData.isExisting(login: loginTextField.text!) {
            alertManager.error(message: "User already exists")
        } else {
            let userObject = User(entity: usersCoreData.entity!, insertInto: usersCoreData.coreDataContext)
            userObject.login = loginTextField.text
            userObject.password = passwordTextField.text
            userObject.email = emailTextField.text
            usersCoreData.save(object: userObject)
            performSegue(withIdentifier: "signInToPageOneSegue", sender: nil)
        }
    }
    
    @IBAction func unwindToSignInController(unwindSegue: UIStoryboardSegue){

    }

}
