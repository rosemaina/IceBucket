//
//  BucketListView.swift
//  IceBucket
//
//  Created by Rose Maina on 31/08/2018.
//  Copyright © 2018 Rose Maina. All rights reserved.
//

import UIKit

class BucketListView: UIViewController {
    
    @IBOutlet weak var tablview: UITableView!
    
    var cell: String?
    
    @IBAction func addBucketListButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "AddToCreateBucketSegue", sender: nil)
        // button to add new bucketlists
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()

        navigationController?.navigationBar.prefersLargeTitles = true
        Networking().getBucketList()

    }
    
    // MARK: - Private instance methods
    
    func registerCells() {
        tablview.register(UINib(nibName: BucketCell.nibName , bundle: nil ), forCellReuseIdentifier: BucketCell.reuseIdentifier)
    }
    
    @objc func addTapped() {
        
        print("Item has been added")
    }
    
}

extension BucketListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
                
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
