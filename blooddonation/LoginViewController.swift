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
import GoogleSignIn

class LoginViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {
   
   
    
    
    
    
    
    var fbLoginSuccess = false
    var email : String = ""
    var firstname : String = ""
    var lastname : String = ""
    var picture : String = ""
    var userId : String = ""
    
    
    @IBOutlet weak var facebook_button: UIButton!
    @IBOutlet weak var google_button: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        // test if user is onncected with facebook or not
        
        
    }
    
    //action to facebook button
    @IBAction func facebook_Action(_ sender: Any) {
        
        loginFacebook();
        
        
    }
    
    @IBAction func google_Action(_ sender: Any) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().uiDelegate=self
        GIDSignIn.sharedInstance().signIn()

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
        
        let northZone = DispatchQueue(label: "facebook")
        let southZone = DispatchQueue(label: "segue")
        

        
       
        
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
                    

                    northZone.sync {
                        self.email = value.dictionaryValue!["email"] as! String;
                        self.firstname = value.dictionaryValue!["first_name"] as! String
                        self.lastname = value.dictionaryValue!["last_name"] as! String
                        self.userId = value.dictionaryValue!["id"] as! String

                        self.picture  = "http://graph.facebook.com/\(value.dictionaryValue!["id"] as! String)/picture?type=large"
                    }
                    
                    
                    //   print(value.dictionaryValue!)
                   
                 
                      //  print("achref",self.email)
                    
                    southZone.sync {
                        if (AccessToken.current != nil )
                        {
                            print("achref",self.email)
                            
                            self.performSegue(withIdentifier: "login", sender: nil)
                            
                        }
                    }

                    
                    
                    
                    
                    
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
                                northZone.sync {
                                    print("sync 1")

                                    self.email = value.dictionaryValue!["email"] as! String;
                                    self.firstname = value.dictionaryValue!["first_name"] as! String
                                    self.lastname = value.dictionaryValue!["last_name"] as! String
                                    self.picture  = "http://graph.facebook.com/\(value.dictionaryValue!["id"] as! String)/picture?type=large"
                                    
                                    
                                }
                              
                            southZone.sync {
                                
                                print("sync 2")
                                print("achref",self.email)

                                if (AccessToken.current != nil)
                                {
                                    print("achref",self.email)

                                    self.performSegue(withIdentifier: "login", sender: nil)
                                    
                                }        }
                            
                            
                        case .failed(let error):
                            print(error)
                        }
                    }
                    
                }
            }
            
        }
    }
    
    
    //connect with google sign in
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
             userId = user.userID                  // For client-side use only!
           // let idToken = user.authentication.idToken // Safe to send to the server
               //  fullName = user.profile.name
            
             self.firstname = user.profile.givenName
             self.lastname = user.profile.familyName
             self.email = user.profile.email
             self.performSegue(withIdentifier: "login", sender: nil)

            

        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let becomeDonor : BecomeDonorViewController = segue.destination as! BecomeDonorViewController
        
        becomeDonor.email = self.email
        becomeDonor.firstname = self.firstname
        becomeDonor.lastname = self.lastname
        becomeDonor.picture = self.picture
        becomeDonor.userId = self.userId
        
    }
    
    
    
    
    
}
