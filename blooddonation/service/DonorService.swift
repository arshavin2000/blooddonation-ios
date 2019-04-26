//
//  DonorService.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/26/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Alamofire
import CoreData


class DonorService
{
    // add user in the datbase
   static func addDonor(user : User) -> Void {
        let parameters = ["id":user.id,"firstname":user.firstname,"lastname":user.lastname,"email":user.email,"number":user.number,"url":user.urlImage
            ,"bloodgroup":user.bloodGroup,"gender":user.gender,"answer":"0","request":"0","rate":"0"]
    
  

    print(parameters)
        Alamofire.request( Utility.basicUrl, method: .post ,parameters: parameters,encoding: JSONEncoding.default ).responseString { response in
            
            switch response.result {
                
            case .success(let JSON):
                
               
                print("JSON",JSON)
                self.addDonorLocal(user: user)
                
                //   print("JSON", accessToken[1])
                
                
            case .failure(let error):
                print("ERROR",error.localizedDescription)                }
        }
    }
    
    static func addDonorLocal(user :User) -> Void {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Users",
                                       in: managedContext)!
        
        let u = NSManagedObject(entity: entity,
                                insertInto: managedContext)
        
        // 3
        u.setValue(user.id, forKeyPath: "id")
        u.setValue(user.email, forKeyPath: "email")
        u.setValue(user.firstname, forKeyPath: "firstname")
        u.setValue(user.lastname, forKeyPath: "lastname")
        u.setValue(user.number, forKeyPath: "number")
        u.setValue(user.gender, forKeyPath: "gender")
        u.setValue(user.bloodGroup, forKeyPath: "blood_group")
        u.setValue(user.urlImage, forKeyPath: "url")
     
        
        
        // 4
        /* do {
         try managedContext.save()
         matches.append(match)
         } catch let error as NSError {
         print("Could not save. \(error), \(error.userInfo)")
         }*/
        
    }
    }

    

