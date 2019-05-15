//
//  MoreViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/15/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit



class MoreViewController: UITableViewController {
    
    
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

}
