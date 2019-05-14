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

extension Array where Element == String? {
    func compactConcate(separator: String) -> String {
        return self.compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: separator)
    }
}

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
    
    
    // store user in the data base
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
    
    static func isUserExist(id: String, completion:@escaping (Bool) -> ()) -> Void {
        let url  = [Utility.basicUrl , "/" , id].compactConcate(separator: "")
        Alamofire.request( url , method: .get ,encoding: JSONEncoding.default ).responseJSON { response in
            
            switch response.result {
                
            case .success(let JSON):
                
                
                let response = JSON as! NSDictionary
                print("JSON",JSON)
                let data = response.object(forKey: "data") as! Int8
                
                if(data == 1)
                {
                    completion(true)
                }else {
                    completion(false)
                }
                
                //self.addDonorLocal(user: user)
                
                //   print("JSON", accessToken[1])
                
                
            case .failure(let error):
                print("ERROR",error.localizedDescription)
                completion(true)
            }
        }

    
    }
    
    
    static func retrieveUser(completion:@escaping (User) -> ()) -> Void {
        
        
        let user = User ()

        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
        //

        do {
            let result = try managedContext.fetch(fetchRequest)

            for data in result as! [NSManagedObject] {

                print("user",data.value(forKey: "email") as! String)

                user?.id = data.value(forKey: "id") as! String
                user?.email = data.value(forKey: "email") as! String
                user?.firstname = data.value(forKey: "firstname") as! String
                user?.lastname = data.value(forKey: "lastname") as! String
                user?.urlImage = data.value(forKey: "url") as! String
                print("achref", data.value(forKey: "url") as! String)
                user?.bloodGroup = data.value(forKey: "blood_group") as! String
                user?.gender = data.value(forKey: "gender") as! String
                user?.number = data.value(forKey: "number") as! String
                
                completion(user!)

               
            }
            
        } catch {
            
            print("Failed")
        }
    }
}

    

