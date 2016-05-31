//
//  Post.swift
//  MyHood
//
//  Created by Ellen Shin on 5/24/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject, NSCoding {
    
    private var _title: String!
    private var _imagePath: String!
    private var _postDesc: String!
    
    var title: String {
        return _title
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var postDesc: String {
    return _postDesc
    }
    
    init(title: String, imagePath: String, description: String) {
        
        self._title = title
        self._imagePath = imagePath
        self._postDesc = description
    }
    
    override init() {
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDesc, forKey: "description")
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
    }
}






