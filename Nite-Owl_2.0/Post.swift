//
//  Post.swift
//  Nite-Owl_2.0
//
//  Created by Jordan Cech on 12/27/16.
//  Copyright © 2016 Jordan Cech. All rights reserved.
//

import Foundation

class Post {
    
    private var _caption: String!
    private var _imageUrl: String!
    private var _timeStamp: String!
    private var _postKey: String! // post ID
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var timeStamp: String {
        return _timeStamp
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageUrl: String, timeStamp: String) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._timeStamp = timeStamp
    }
    
    // parse data, given 'postKey'
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let timeStamp = postData["timeStamp"] as? String {
            self._timeStamp = timeStamp
        }
    }
}








