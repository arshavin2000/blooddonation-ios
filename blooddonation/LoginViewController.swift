//
//  LoginViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class LoginViewController: UIViewController {

    @IBOutlet weak var facebook_button: UIButton!
    @IBOutlet weak var google_button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //action to facebook button
    @IBAction func facebook_Action(_ sender: Any) {
    }
    
    @IBAction func google_Action(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // connect with facebook
    @objc func loginFacebook() {
        
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            print(accessToken.userId!)
            print(accessToken.appId)
            print(accessToken.grantedPermissions!)
            print(accessToken.expirationDate)
            
            let request = GraphRequest(graphPath: "me", parameters: ["fields":"id,email,name,first_name,last_name,picture.type(large)"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
            request.start { (response, result) in
                switch result {
                case .success(let value):
                    //   print(value.dictionaryValue!)
                    let email = value.dictionaryValue!["email"];
                    let firstname = value.dictionaryValue!["first_name"]
                    let lastname = value.dictionaryValue!["last_name"]
                    let picture  = "http://graph.facebook.com/\(value.dictionaryValue!["id"] as! String)/picture?type=large"
                   
                    
                case .failed(let error):
                    print(error)
                }
            }
        }
        else{
            let loginManager=LoginManager()
            
            loginManager.logIn(readPermissions: [ReadPermission.publicProfile, .email,], viewController : self) { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    print("Logged in : \(grantedPermissions), \n \(declinedPermissions), \n \(accessToken.appId), \n \(accessToken.authenticationToken), \n \(accessToken.expirationDate), \n \(accessToken.userId!), \n \(accessToken.refreshDate), \n \(accessToken.grantedPermissions!)")
                    
                    let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, first_name, last_name, picture.type(large)"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: FacebookCore.GraphAPIVersion.defaultVersion)
                    request.start { (response, result) in
                        switch result {
                        case .success(let value):
                            //  print(value.dictionaryValue!)
                            let email = value.dictionaryValue!["email"];
                            let firstname = value.dictionaryValue!["first_name"]
                            let lastname = value.dictionaryValue!["last_name"]
                            let picture  = "http://graph.facebook.com/\(value.dictionaryValue!["id"] as! String)/picture?type=large"
                            
                         
                            
                            
                            
                        case .failed(let error):
                            print(error)
                        }
                    }
                    
                }
            }
            
        }
    }
    
    
 

}
