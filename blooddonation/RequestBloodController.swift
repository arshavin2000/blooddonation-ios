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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func submitAction(_ sender: Any) {
        
       // RequestService.addRequest(user: T##User, bloodGroup: <#T##String#>, city: <#T##String#>)
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
