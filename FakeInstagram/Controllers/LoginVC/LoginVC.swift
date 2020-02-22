//
//  LoginVC.swift
//  FakeInstagram
//
//  Created by Ian Shen on 2/22/20.
//  Copyright © 2020 Ian Shen. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ourUserID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func handleLogin() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                self.displayError("Login Error")
                return
            }
            guard user != nil else {
                self.displayError("user error")
                return
            }
            self.performSegue(withIdentifier: "toMainFeed", sender: self)
        }
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        handleLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func displayError(_ message:String) {
            let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertView, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FeedVC {
            //destinationVC.pokemon = pokemon
        }
    }
}
