//
//  LoginViewController.swift
//  Tutorio
//
//  Created by Akshat Goyal on 7/29/16.
//  Copyright © 2016 Tutorio. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInPressed(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(userNameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("logged in")
            } else {
                print(error?.localizedDescription)
            }
        }
    }
}
