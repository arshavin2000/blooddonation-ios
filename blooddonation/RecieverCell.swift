//
//  RecieverCell.swift
//  blooddonation
//
//  Created by user on 5/14/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class RecieverCell: UITableViewCell {

    
    @IBOutlet weak var laTextMsg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMessage(message:Message){
    laTextMsg.text = message.message
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
