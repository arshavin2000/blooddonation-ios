//
//  HomeController.swift
//  blooddonation
//
//  Created by user on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class HomeController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var posts = Array<Post>();
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UIPostCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! UIPostCell
        cell.laDate.text = posts[indexPath.row].date
        cell.laUsername.text = posts[indexPath.row].username
     
        return cell
    }
    
    

    @IBOutlet weak var laTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laTableView.delegate = self
        laTableView.dataSource = self

        // Do any additional setup after loading the view.
        //let p = Post(username: "Haffez med", description: "String", date: "23h", imgProfile: "String", imgPost: "String")
        posts.append(Post(username: "String", description: "String", date: "String", imgProfile: "String", imgPost: "String"))
         posts.append(Post(username: "String", description: "String", date: "String", imgProfile: "String", imgPost: "String"))
         posts.append(Post(username: "String", description: "String", date: "String", imgProfile: "String", imgPost: "String"))
        print("Count Items Posts",posts.count )

    
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
