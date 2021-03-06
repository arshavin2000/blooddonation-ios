//
//  RequestBloodController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/10/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit


class RequestBloodController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var blood: UISegmentedControl!
    @IBOutlet weak var submit: UIButton!
    
    
    var bloodGroup : String!
    
    static var nb = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        
        DonorService.retrieveUser { (user) in
            print("request", user)
            self.name.text = user.firstname + " " + user.lastname
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bloodAction(_ sender: Any) {
        
        switch blood.selectedSegmentIndex {
        case 0:
            bloodGroup = "A+"
            break
        case 1 :
            bloodGroup = "A-"
            break
        case 2:
            bloodGroup = "B+"
            break
        case 3:
            bloodGroup = "B-"
            break
        case 4 :
            bloodGroup = "O+"
            break
        case 5:
            bloodGroup = "O-"
            break
        case 6 :
            bloodGroup = "AB+"
            break
        case 7 :
            bloodGroup = "AB-"
            break
        default:
            bloodGroup = "A"
            break
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        DispatchQueue(label: "load").async(
            execute: {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        })
        dismiss(animated: true, completion: nil)
    }
    @IBAction func submitAction(_ sender: Any) {
        
       
        DonorService.retrieveUser { (user) in
            print("request", user)
            RequestService.addRequest(user: user , bloodGroup: self.bloodGroup, city: self.city.text!)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            self.city.text = ""
            RequestBloodController.nb+=1
            let preferences = UserDefaults.standard
            
            let currentLevelKey = "nb"
            
            preferences.set(RequestBloodController.nb, forKey: currentLevelKey)
            
            //  Save to disk
            preferences.synchronize()
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
