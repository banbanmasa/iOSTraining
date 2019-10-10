//
//  ViewController.swift
//  NavigationSample
//
//  Created by 鈴木 大貴 on 2016/10/23.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscape]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rightButton = UIBarButtonItem(title: "pop", style: .plain, target: self, action: #selector(ViewController.rightButtonTapped(_:)))
           navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("will layout subviews")
    }

    // [3] 回転前処理
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            print("to Landscape")
        } else {
            print("to Portrait")
        }
    }

    // [4] traitCollectionが変更される場合、任意のアニメーションをここで設定
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("will change collection")
    }

    // [5] traitCollection変更完了処理
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("did change collection")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
    }

}

