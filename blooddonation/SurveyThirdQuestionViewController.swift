//
//  SurveyThirdQuestionViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/24/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import SMSegmentView


class SurveyThirdQuestionViewController: UIViewController {

    @IBOutlet weak var survey4: UISwitch!
    @IBOutlet weak var suvey3: UISwitch!
    @IBOutlet weak var suvey1: UISwitch!
    
    @IBOutlet weak var survey2: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func survey1Action(_ sender: Any) {
        if(suvey1.isSelected)
        {
            SurveyFirstQuestionViewController.score+=1;
        }
        
        
    }
    
    @IBAction func survey2Action(_ sender: Any) {
        if(survey2.isSelected)
        {
        SurveyFirstQuestionViewController.score+=1;
        }
    }
    @IBAction func Survey3Action(_ sender: Any) {
        if(suvey3.isSelected)
        {
        SurveyFirstQuestionViewController.score+=1;
        }
    }
    @IBAction func Survey4Action(_ sender: Any) {
        if(survey4.isSelected)
        {
        SurveyFirstQuestionViewController.score+=1;
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
