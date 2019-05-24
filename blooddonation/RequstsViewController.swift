//
//  RequstsViewController.swift
//  blooddonation
//
//  Created by Achref Meghirbi on 5/13/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Alamofire



class RequstsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nb_requests: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
      var requests: [Request] = []

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let contentview = cell?.viewWithTag(8)
        
        let name = contentview?.viewWithTag(2) as! UILabel
        let place = contentview?.viewWithTag(3) as! UILabel
        let number = contentview?.viewWithTag(4) as! UIButton
        let bloodGroup = contentview?.viewWithTag(5) as! UIButton

        let image = contentview?.viewWithTag(1) as! UIImageView
        
        let request = requests[indexPath.row]
        name.text = request.user.firstname + " " + request.user.lastname
        place.text = request.place
      //  image.image = UIImage(named: request.user.urlImage )
        bloodGroup.setTitle(request.bloodGroup , for: .normal)
        number.setTitle("Unlock Chat", for: .normal)
        let imageUrl:URL = URL(string: request.user.urlImage)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        let imageFinal = UIImage(data: imageData as Data)
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true

        image.image = imageFinal
     //   nameSeason.text = Seasons[indexPath.row].value(forKey: "name") as! String
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        


        RequestService.fetchRequest{(requests) in
            print("hama",requests.count)
            self.requests = requests
            self.tableview.reloadData()
            
        }
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        RequestService.fetchRequest{(requests) in
            self.requests = requests
        }
        DispatchQueue.main.async(
            execute:{self.tableview.reloadData()
        }
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     /*   RequestService.fetchRequest{(requests) in
            self.requests = requests
            
            
        }*/
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
