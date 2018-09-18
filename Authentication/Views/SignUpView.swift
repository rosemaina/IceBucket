//
//  SignUpView.swift
//  IceBucket
//
//  Created by Rose Maina on 30/08/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import UIKit

class SignUpView: UIViewController {
    
    
    @IBAction func viewBucketListsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpToBucketLists", sender: nil)
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpToLogin", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
