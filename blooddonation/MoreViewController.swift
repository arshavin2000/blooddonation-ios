//
//  MoreViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/15/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import GoogleSignIn
import FacebookLogin
import FacebookCore



class MoreViewController: UITableViewController {
    
    @IBOutlet weak var nb_request: UILabel!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var image_profile: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet var tableview: UITableView!
    var mores: [String] = ["Survey", "Logout"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mores.count ;
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "more")
        let contentview = cell?.viewWithTag(0)
        
        let name = contentview?.viewWithTag(1) as! UILabel
        
        name.text = mores[indexPath.row]
        
        return cell!
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        DonorService.retrieveUser { (user) in
            print("request", user)
            self.name.text = user.firstname + " " + user.lastname
            self.email.text = user.email
            
            let imageUrl:URL = URL(string: user.urlImage)!
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let imageFinal = UIImage(data: imageData as Data)
            self.image_profile.layer.cornerRadius = self.image_profile.frame.size.height/2
            self.image_profile.layer.borderWidth = 1
            self.image_profile.layer.borderColor = UIColor.black.cgColor
            self.image_profile.clipsToBounds = true
            self.image_profile.image = imageFinal
            print("scorescore", String(SurveyFirstQuestionViewController.score))
            let preferences = UserDefaults.standard
            
            let currentLevelKey = "score"
            let currentLevelKey1 = "nbn"

            
            if preferences.object(forKey: currentLevelKey) == nil {
                //  Doesn't exist
            } else {
                let currentLevel = preferences.integer(forKey: currentLevelKey)
                self.score.text = String(currentLevel)

            }
            if preferences.object(forKey: currentLevelKey1) == nil {
                //  Doesn't exist
            } else {
                let currentLevel1 = preferences.integer(forKey: currentLevelKey1)
                self.nb_request.text = String(currentLevel1)

            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0: //For "one"
            segueIdentifier = "survey"
        case 1: //For "two"
            segueIdentifier = "logout"
            if GIDSignIn.sharedInstance().hasAuthInKeychain()
            {
            GIDSignIn.sharedInstance().signOut()
            DonorService.deleteUSer();
            }else{

                let loginManager=LoginManager()
                loginManager.logOut()
            }
            

        default: //For "three"
            segueIdentifier = "survey"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
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
