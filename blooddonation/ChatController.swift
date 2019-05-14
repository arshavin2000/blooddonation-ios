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
class ChatController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfChatInfo.count

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        switch listOfChatInfo[indexPath.row].message{
        case "0":
            let cellChat:MessageCell = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! MessageCell
            cellChat.setMessage(message: listOfChatInfo[indexPath.row])
            return cellChat
        default:
            let cellChat:RecieverCell = tableView.dequeueReusableCell(withIdentifier: "cellReciever1", for: indexPath) as! RecieverCell
            cellChat.setMessage(message: listOfChatInfo[indexPath.row])
            return cellChat
        }
    }
    
    var ref = DatabaseReference.init()
    var currentUser = User()
    @IBOutlet weak var inMsgField: UITextField!
    
    @IBOutlet weak var laTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    
        laTableView.delegate = self
        laTableView.dataSource = self
        self.ref = Database.database().reference()
        
        DonorService.retrieveUser { (user) in
            Auth.auth().createUser(withEmail: user.email, password: user.id) { user1, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: user.email,
                                       password: user.id)
                }
                self.currentUser = user
                self.loadRoom()

                
            }

            
        }

    }
    

    var listOfChatInfo = [Message] ()
    func loadRoom(){
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe(.value) { (DataSnapshot) in
            self.listOfChatInfo.removeAll()
            if let DataSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot]{
                for snapshot in DataSnapshot {
                    if let message = snapshot.value as? [String:AnyObject]{
                        let sender = message["sender"] as? String
                        let text = message["text"] as? String
                        let reciver = message["reciver"] as? String
                        var postDate:CLong?
                        if let postDateIn = message["postDate"] as? CLong{
                            postDate = postDateIn
                        }
                        self.listOfChatInfo.append(Message(message: text!))

                        
                    }
                }
                self.laTableView.reloadData()
                let indexPath = IndexPath(row: self.listOfChatInfo.count-1, section: 0)
                self.laTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)

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
