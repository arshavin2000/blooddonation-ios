//
//  SurveySecondQuestionViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/24/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class SurveySecondQuestionViewController: UIViewController {

    @IBOutlet weak var survey: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func surveyAction(_ sender: Any) {
        
        if(survey.selectedSegmentIndex == 1)
        {
            SurveyFirstQuestionViewController.score+=1;

        }else
            if(survey.selectedSegmentIndex == 2)
            {
                SurveyFirstQuestionViewController.score+=1;
                
        }
            else{
                if(survey.selectedSegmentIndex == 2)
                {
                    SurveyFirstQuestionViewController.score+=2;
                    
                }
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
