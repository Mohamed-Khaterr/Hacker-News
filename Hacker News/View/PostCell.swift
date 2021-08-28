//
//  UITabTableViewCell.swift
//  Hacker News
//
//  Created by Khater on 8/28/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
