//
//  RequestService.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/10/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Alamofire

class RequestService
{
    static func addRequest(user : User , bloodGroup : String , city : String) -> Void {
        let donor = ["id":user.id,"firstname":user.firstname,"lastname":user.lastname,"email":user.email,"number":user.number,"url":user.urlImage
            ,"bloodgroup":user.bloodGroup,"gender":user.gender,"answer":"0","request":"0","rate":"0"]
        
        let parameters =  ["donor": donor , "bloodgroup" : bloodGroup , "place" : city ] as [String : Any]
        
        
        
        print(parameters)
        Alamofire.request( Utility.requestUrl, method: .post ,parameters: parameters,encoding: JSONEncoding.default ).responseString { response in
            
            switch response.result {
                
            case .success(let JSON):
                
                
                print("JSON",JSON)
                
                //   print("JSON", accessToken[1])
                
                
            case .failure(let error):
                print("ERROR",error.localizedDescription)                }
        }
    }
    
    
  
}
