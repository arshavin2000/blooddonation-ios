//
//  MessageCell.swift
//  blooddonation
//
//  Created by user on 5/14/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var laTxtMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMessage(message:Message)  {
        laTxtMessage.text =  message.message
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
