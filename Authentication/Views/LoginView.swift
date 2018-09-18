//
//  LoginView.swift
//  IceBucket
//
//  Created by Rose Maina on 30/08/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    // MARK: Private Instance Properties

    @IBOutlet weak var emailTextInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextInput: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if(loginButton.titleLabel?.text == "LOGOUT"){
            
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            loginToDo()
        }
        
        let email = emailTextInput.text
        let password = passwordTextInput.text
        
        if (email == "" || password == "") {
            return
        }
        
        DoLogin(email!, password!)
        
//        Networking().login()
//        performSegue(withIdentifier: "loginToBucketsSegue", sender: nil)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "loginToSignUpSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = UserDefaults.standard
        
        if(preferences.object(forKey: "session") != nil) {
            loginDone()
        } else {
            loginToDo()
        }
    }
    
    // MARK: Private Instance Methods
    
    func DoLogin(_ email: String,_ password: String) {
        
        let url = URL(string: "https://bucketlist-api1.herokuapp.com/auth/login/")
        let session = URLSession.shared
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let paramsToSend: [String: String]  = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: paramsToSend)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                 return print("Something went wrong \(error)")
            }
            
            guard let _: Data = data else { return }
            
            let json:Any?
            
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            } catch {
                return
            }
            
            guard let serverResponse = json as? [String: Any] else { return }
            
            if let token = serverResponse["token"] {
                
                let saveToken = UserDefaults.standard
                saveToken.set(token, forKey: "token")
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "loginToBucketsSegue", sender: nil)
                }
            }
        }
        task.resume()
    }
    
    func loginToDo() {
       
        emailTextInput.isEnabled = true
        passwordTextInput.isEnabled = true
        
        loginButton.setTitle("LOGIN", for: .normal)
    }
    
    func loginDone() {
        emailTextInput.isEnabled = false
        passwordTextInput.isEnabled = false
        
        loginButton.setTitle("LOGOUT", for: .normal)
    }
}
