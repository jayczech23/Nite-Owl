//
//  CircleView.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 12/21/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
        
    }
    
}
