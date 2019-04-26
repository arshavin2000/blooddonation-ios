//
//  User.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit


class User
{
    internal init(id: String, firstname: String, lastname: String, email: String, gender: String, bloodGroup: String, urlImage: String, birthDate: String, number: String, answer: String, request: String, rate: String) {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.gender = gender
        self.bloodGroup = bloodGroup
        self.urlImage = urlImage
        self.birthDate = birthDate
        self.number = number
        self.answer = answer
        self.request = request
        self.rate = rate
    }
    
   

    var id: String
    var firstname: String
    var lastname: String
    var email: String
    var gender: String
    var bloodGroup: String
    var urlImage: String
    var birthDate: String
    var number: String
    var answer: String
    var request: String
    var rate: String
    
    
    internal init?() {
        
        
        id = ""
        firstname = ""
        email = ""
        lastname = ""
        gender = ""
        bloodGroup = ""
        birthDate = ""
        urlImage = ""
        number = ""
        request = ""
        answer = ""
        rate = ""
       
        
    }
    
    
}
