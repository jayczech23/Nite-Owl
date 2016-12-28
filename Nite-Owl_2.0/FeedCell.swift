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
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    
    var post: Post!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //
    }
    
    
    func configureCell(post: Post) {
    
        self.post = post
        self.captionLbl.text = post.caption
        self.timeStampLbl.text = post.timeStamp
    }
    
    
   
}
