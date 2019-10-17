//
//  NextViewController.swift
//  NavigationSample
//
//  Created by masanobu.ban on 2019/10/10.
//  Copyright © 2019 szk-atmosphere. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let buttonString = buttonString else { return }
        label.text = "Button \(buttonString) Tapped"
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
