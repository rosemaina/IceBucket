//
//  SignUpView.swift
//  IceBucket
//
//  Created by Rose Maina on 30/08/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignUpView: UIViewController, GIDSignInUIDelegate {
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        performSegue(withIdentifier: "SignUpToBucketLists", sender: nil)
//    }
    
    
    // MARK: - Private Instance Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self as GIDSignInUIDelegate
        
        // Uncomment to automatically sign in the user.
//        GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
    }
    
    // MARK: - Private Instance Methods
    
    @IBAction func viewBucketListsButton(_ sender: UIButton) {

    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpToLogin", sender: nil)
    }
    
}
