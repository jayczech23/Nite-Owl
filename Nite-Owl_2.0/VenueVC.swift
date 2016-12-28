//
//  ViewController.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 10/14/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class VenueVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // set listener for database.
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            
            // parse firebase data
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
                
            }
            self.tableView.reloadData()
        })
        
    }
//----------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//----------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
//----------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return FeedCell()
        }
    }
//----------------------------------------------------------------
    @IBAction func backBtnTapped(_ sender: Any) {
        
        performSegue(withIdentifier: backToMapSegue, sender: nil)
        
    }
//----------------------------------------------------------------    
    
    
}

