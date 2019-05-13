//
//  UIPostCell.swift
//  blooddonation
//
//  Created by user on 4/25/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit

class UIPostCell: UITableViewCell {
    @IBOutlet weak var laProfilImg: UIImageView!
    @IBOutlet weak var laUsername: UILabel!
    
    @IBOutlet weak var laDate: UILabel!
    @IBOutlet weak var laPostImg: UIImageView!
    @IBOutlet weak var laDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
