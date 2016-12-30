//
//  Venue.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 12/29/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import Foundation
import Firebase

class Venue {
    
    private var _name: String!
    private var _imageUrl: String!
    //private var _event: String! // feature for a later version
    private var _latitude: Double!
    private var _longitude: Double!
    private var _venueKey: String!
    private var _posts: FIRDatabaseReference!
    
    
    var name: String {
        return _name
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var latitude: Double {
        return _latitude
    }
    
    var longitude: Double {
        return _longitude
    }
    
    var venueKey: String {
        return _venueKey
    }
//-----------------------------------------------------------------    
    init(name: String, imageUrl: String, latitude: Double, longitude: Double) {
        self._name = name
        self._imageUrl = imageUrl
        self._latitude = latitude
        self._longitude = longitude
        
    }
    
    // parse data given 'venue Key'
    init(venueKey: String, venueData: Dictionary<String, AnyObject>) {
        self._venueKey = venueKey
        
        if let name = venueData["name"] as? String {
            self._name = name
        }
        
        if let imageUrl = venueData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let latitude = venueData["latitude"] as? Double {
            self._latitude = latitude
        }
        
        if let longitude = venueData["longitude"] as? Double {
            self._longitude = longitude
        }
//-----------------------------------------------------------------
    }
    
    
 
    
    
    
    
    
    
    
    
    
    
    
    
}
