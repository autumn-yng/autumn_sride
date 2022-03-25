//
//  LoginViewController.swift
//  autumn_sride
//
//  Created by Autumn Y Ngoc on 3/24/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        // Create a new PFUser object in the server
        let user = PFUser()
        //
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { success, error in
            if success {
                print("Successfully signing up.")
                self.performSegue(withIdentifier: "logInToFeed", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                print("Successfully signing in")
                self.performSegue(withIdentifier: "logInToFeed", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
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
