//
//  ProfileViewController.swift
//  Effective mobile
//
//  Created by Denis Klimov on 17.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = 50.0
        profileImage.clipsToBounds = true
        
    }
    
    @IBAction func logoutAction() {
        UserDefaults.standard.set(false, forKey: "isAuthorized")
        
    }
    
    /*
   
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
