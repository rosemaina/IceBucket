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
    var bucketLists: [[String: Any]] = [[:]]
    
    @IBAction func addBucketListButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "AddToCreateBucketSegue", sender: nil)
        // button to add new bucketlists
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()

        navigationController?.navigationBar.prefersLargeTitles = true
        Networking().getBucketList(url: "/bucketlist/") { (data) in
            guard let data = data as? NSDictionary else { return }
            
            DispatchQueue.main.async {
                self.bucketLists = data["bucketlist"] as! [[String: Any]]
                self.tablview.reloadData()
            }
        }

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
        return bucketLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketCell.reuseIdentifier, for: indexPath) as! BucketCell
        cell.bucketTitle.text = bucketLists[indexPath.row] ["title"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
                
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
