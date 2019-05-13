//
//  CenterService.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/26/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Alamofire

struct Center {
    var address : String!
    var fax : String!
    var tel : String!
    var site : String!
    var name : String!
}
class CenterService
{
    static func getCenters(completion:@escaping ([Center]) -> ()) -> Void {
        let url  = [Utility.centerUrl   ].compactConcate(separator: "")
        Alamofire.request( url , method: .get ,encoding: JSONEncoding.default ).responseJSON { response in
            
            switch response.result {
                
            case .success(let JSON):
                
                var array:[Center] = []

                let response = JSON as! NSDictionary
                print("JSON",JSON)
                let data = response.object(forKey: "data")
                let centers = data as! NSArray
                
                for index in 0...centers.count - 1 {
                    
                    let center = centers[index] as! NSDictionary
                    let address = center.object(forKey: "address")
                    let fax = center.object(forKey: "fax")
                    let site = center.object(forKey: "site")
                    let tel = center.object(forKey: "tel")
                    let name = center.object(forKey: "name")


                    array.append(Center(address: address as? String, fax: fax as? String, tel: tel as? String , site: site as? String , name: name as? String))
                    print(array)

                    
                }
                completion(array)
                
             
                //self.addDonorLocal(user: user)
                
                //   print("JSON", accessToken[1])
                
                
            case .failure(let error):
                print("ERROR",error.localizedDescription)
            }
        }
        
        
    }
}
