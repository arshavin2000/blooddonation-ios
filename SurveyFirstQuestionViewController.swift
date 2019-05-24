//
//  SurveyFirstQuestionViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/24/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class SurveyFirstQuestionViewController: UIViewController {

    static var  score = 0
    @IBOutlet weak var survey: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func suveyAction(_ sender: Any) {
        if(survey.selectedSegmentIndex == 0)
        {
            SurveyFirstQuestionViewController.score+=1;
        }else{
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
