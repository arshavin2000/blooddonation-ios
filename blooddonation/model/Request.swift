//
//  User.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit


class Request
{
    internal init(user: User, bloodGroup: String, place: String) {
        self.user = user
        self.bloodGroup = bloodGroup
        self.place = place
       
    }
    
    
    
    var user: User
    var place: String
    var bloodGroup: String
   
    
    
    internal init?() {
        
        user =  User()!
        bloodGroup = ""
        place = ""
        
    }
    
    
}
