//
//  ViewController.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 10/14/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit

class VenueVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as? FeedCell {
        
            cell.configureCell()
            
            return cell
        } else {
            
            return FeedCell()
        }
    }
}

