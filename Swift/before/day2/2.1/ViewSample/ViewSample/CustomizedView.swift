//
//  CustomizedView.swift
//  ViewSample
//
//  Created by masanobu.ban on 2019/10/10.
//  Copyright © 2019 szk-atmosphere. All rights reserved.
//

import UIKit

class CustomizedView: UIView {
    class func view() -> CustomizedView {
        return Bundle.main.loadNibNamed("CustomizedView", owner: nil, options: nil)?.last as! CustomizedView
    }

    // xibを使用した場合に呼ばれる
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
           print("tapped!")
    }
}
