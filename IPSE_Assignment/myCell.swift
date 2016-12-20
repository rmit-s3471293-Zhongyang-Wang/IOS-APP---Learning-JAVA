//
//  myCell.swift
//  TableView
//
//  Created by Zhongyang Wang on 7/04/2016.
//  Copyright © 2016 扬. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var textDisplay: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
