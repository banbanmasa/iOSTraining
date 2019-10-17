//
//  AddViewController.swift
//  ViewControllerBasic
//
//  Created by masanobu.ban on 2019/10/08.
//  Copyright © 2019 marty-suzuki. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
         label.text = "YES"
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
