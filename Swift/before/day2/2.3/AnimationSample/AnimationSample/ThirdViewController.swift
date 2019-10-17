//
//  ThirdViewController.swift
//  AnimationSample
//
//  Created by masanobu.ban on 2019/10/10.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var brownView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let greenView = UIView()
//  greenView.backgroundColor = .green
//  greenView.translatesAutoresizingMaskIntoConstraints = false
//  brownView.addSubview(greenView)
//  brownView.addConstraints([
//      NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: brownView, attribute: .top, multiplier: 1, constant: 50),
//      NSLayoutConstraint(item: greenView, attribute: .left, relatedBy: .equal, toItem: brownView, attribute: .left, multiplier: 1, constant: 50),
//      NSLayoutConstraint(item: greenView, attribute: .right, relatedBy: .equal, toItem: brownView, attribute: .right, multiplier: 1, constant: -50),
//      NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: brownView, attribute: .bottom, multiplier: 1, constant: -50)
//  ])
}
