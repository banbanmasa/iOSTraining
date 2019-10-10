//
//  CustomCell.swift
//  TableViewSample
//
//  Created by masanobu.ban on 2019/10/10.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
