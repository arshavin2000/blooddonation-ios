//
//  ChatController.swift
//  blooddonation
//
//  Created by user on 5/13/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreData
class ChatController: UIViewController {
    var people: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Auth.auth().createUser(withEmail: "haffez23@gmail.com", password: "haffez12345") { user, error in
            if error == nil {
                // 3
                Auth.auth().signIn(withEmail: "haffez23@gmail.com",
                                   password: "haffez12345")
            }
        }
    
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
            print("=============================")
            print(people)
            print("=============================")

        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
