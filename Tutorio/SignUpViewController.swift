//
//  SignUpViewController.swift
//  Tutorio
//
//  Created by Akshat Goyal on 7/30/16.
//  Copyright © 2016 Tutorio. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        if userNameTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" || nameTextField.text == "" {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Please Fill All the Fields"
            alert.addButtonWithTitle("OK")
            alert.show()
        } else if passwordTextField.text != confirmPasswordTextField.text {
            let alert = UIAlertView()
            alert.title = "Error"
            alert.message = "Passwords don't match"
            alert.addButtonWithTitle("OK")
            alert.show()
        } else {
            let newUser = PFUser()
            newUser.username = userNameTextField.text
            newUser.password = passwordTextField.text
            
            newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success{
                    print("created user")
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
        
    }
    
    
}
