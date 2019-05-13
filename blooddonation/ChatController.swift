//
//  ChatController.swift
//  blooddonation
//
//  Created by user on 5/13/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import CoreData
class ChatController: UIViewController {
    var ref = DatabaseReference.init()
    var currentUser = User()
    @IBOutlet weak var inMsgField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    
        self.ref = Database.database().reference()
        
        DonorService.retrieveUser { (user) in
            Auth.auth().createUser(withEmail: user.email, password: user.id) { user1, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: user.email,
                                       password: user.id)
                }
                self.currentUser = user

                
            }

            
        }

    }
    

  
    @IBAction func sendMsgAction(_ sender: Any) {
    
        let dic = [
            "text": self.inMsgField.text!,
            "sender": self.currentUser?.id,
            "reciver": "id_reciver",
            "postDate" : ServerValue.timestamp(),

            ] as [String : Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
    }
    
}
