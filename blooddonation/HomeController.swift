//
//  HomeController.swift
//  blooddonation
//
//  Created by user on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var posts = Array<Post>();
    var jsonRep:JSON = JSON();

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UIPostCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! UIPostCell
        cell.laDate.text = posts[indexPath.row].date
        cell.laUsername.text = posts[indexPath.row].username

        let urlImgPost = URL(string: posts[indexPath.row].imgPost)
        let urlImgProfile = URL(string: posts[indexPath.row].imgProfile)

        let dataImgPost = try? Data(contentsOf: urlImgPost!)
        let dataImgProfile = try? Data(contentsOf: urlImgProfile!)
        
        
        if dataImgPost != nil {
            cell.laPostImg.image = UIImage(data: dataImgPost!)

        }
        else {
            cell.laPostImg.image = UIImage(named: "image-not-available")

        }
        
        cell.laProfilImg.image = UIImage(data: dataImgProfile!)
        
        return cell
    }
    
    

    @IBOutlet weak var laTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        let url = "http://192.168.1.14:3000/api/posts"
        loadFromWS(url: url)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laTableView.delegate = self
        laTableView.dataSource = self
    }
    
    func loadFromWS(url:String){
    do{
        let appUrl = URL(string :url)!
        let data = try Data(contentsOf: appUrl)
        let json:JSON = try JSON(data: data)
        jsonRep = json;
        for (index,subJson):(String, JSON) in jsonRep {
            // Do something you want
          print(subJson["user"]["firstname"])
            
            posts.append(Post(username: subJson["user"]["firstname"].string!+" "+subJson["user"]["lastname"].string!, description: subJson["postText"].string!, date: "2 h", imgProfile:  subJson["user"]["url"].string!, imgPost:  subJson["postImage"].string!))
        }
    }
    catch{
    print("cannot read data server")
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
