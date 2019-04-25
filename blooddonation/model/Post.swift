//
//  Post.swift
//  blooddonation
//
//  Created by user on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class Post {
    
    var username:String?
    var description:String?
    var date:String?
    var imgProfile:String
    var imgPost:String?
    
    init(username:String,description:String,date:String,imgProfile:String,imgPost:String) {
        self.username = username;
        self.description = description;
        self.date = date;
        self.imgProfile = imgProfile;
      
    }

}
