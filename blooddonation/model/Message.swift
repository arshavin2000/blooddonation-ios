//
//  Message.swift
//  blooddonation
//
//  Created by user on 5/14/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class Message {
    
    var message:String?
    var sender:String?
    var reciever:String?
    var postDate:CLong?
    init(message:String, sender:String, reciever:String,postDate:CLong ) {
        self.message = message
        self.sender = sender
        self.reciever = reciever
        self.postDate = postDate
    }

}
