//
//  BecomeDonorViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class BecomeDonorViewController: UIViewController {
    
    var email : String!
    var firstname : String!
    var lastname : String!
    var picture : String!
    var userId : String!
    var genderType : String! = "male"
    var bloodGroup : String! = "A+"

    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var number_text: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var blood_group: UISegmentedControl!
    @IBOutlet weak var terms: UISwitch!
    @IBOutlet weak var done_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name_text.text = firstname  + " " + lastname 
        email_text.text = email
        name_text.isUserInteractionEnabled = false
        email_text.isUserInteractionEnabled = false


        

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func done_action(_ sender: Any) {
        let user = User ()
        user?.id = userId
        user?.email = email
        user?.firstname = firstname
        user?.lastname = lastname
        user?.urlImage = picture
        user?.bloodGroup = bloodGroup
        user?.gender = genderType
        user?.number = number_text.text!

        DonorService.addDonor(user : user!)

    }
    
    @IBAction func genderAction(_ sender: Any) {
        
        switch gender.selectedSegmentIndex {
        case 0:
            genderType = "male"
            break
        case 1 :
            genderType = "female"
            break
        default:
            genderType = "male"
            break
        }
    }
    
    @IBAction func blood_groupAction(_ sender: Any) {
        
        switch blood_group.selectedSegmentIndex {
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
            genderType = "A"
            break
        }
    }
    
    @IBAction func termsAction(_ sender: Any) {
        
    
    }
}
