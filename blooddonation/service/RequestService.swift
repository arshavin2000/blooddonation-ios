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
        
        print("request")
        let donor = ["id":user.id,"firstname":user.firstname,"lastname":user.lastname,"email":user.email,"number":user.number,"url":user.urlImage
            ,"bloodgroup":bloodGroup,"gender":city ,"answer":"0","request":"0","rate":"0"]
        
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
    
    
    static func fetchRequest(completion:@escaping ([Request]) -> ()) -> Void {
    
        Alamofire.request( Utility.requestUrl, method: .get,encoding: JSONEncoding.default ).responseJSON { response in
            
            switch response.result {
                
            case .success(let JSON):
                
                var array:[Request] = []

                
                print("JSON",JSON)
                let requests = JSON as! NSArray
                print("response",requests)
                
                for index in 0...requests.count - 1 {
                    
                    let request = requests[index] as! NSDictionary

                    let bloodGroup = request.object(forKey: "bloodgroup") as! String
                    let place = request.object(forKey: "place") as! String
                    let donor = request.object(forKey: "donor") as! NSObject
                    let email = donor.value(forKey: "email")
                    let firstname = donor.value(forKey: "firstname")
                    let lastname = donor.value(forKey: "lastname")
                    let url = donor.value(forKey: "url")
                    let id = donor.value(forKey: "id")


                    let user = User()
                    user?.email = email as! String
                    user?.firstname = firstname as! String
                    user?.lastname = lastname as! String
                    user?.id = id as! String
                    user?.urlImage = url as! String
                    let  r = Request(user : user! , bloodGroup : bloodGroup , place : place)
                    

                    array.append(r)

                /*    let site = center.object(forKey: "site")
                    let tel = center.object(forKey: "tel")
                    let name = center.object(forKey: "name")
                    
                    
                    array.append(Center(address: address as? String, fax: fax as? String, tel: tel as? String , site: site as? String , name: name as? String))*/
                }
                
                completion(array)

                
                //   print("JSON", accessToken[1])
                
                
            case .failure(let error):
                print("ERROR",error.localizedDescription)                }
            
        }
    }
    
  
}
