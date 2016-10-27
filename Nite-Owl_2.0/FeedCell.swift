//
//  FeedCell.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 10/26/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    
    func configureCell() {
    
        // configure userImage to have rounded corners.
        
        userImage.layer.cornerRadius = 8.0
        userImage.clipsToBounds = true
    
    
    }
    
    
   
}
