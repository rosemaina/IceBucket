//
//  BucketListDetailView.swift
//  IceBucket
//
//  Created by Rose Maina on 06/09/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import UIKit

class BucketListDetailView: UITableViewController, UITextFieldDelegate {

    // MARK: Private Instance Properties

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textfield: UITextField!
    
    
//    var bucketToEdit
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: Private Instance Methods
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
        
    }
    
    // Copy and paste and update the textfield
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // getting old text from the textfield, checking the range of the text that has changed and replacing it with new text.
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
}
