//
//  ViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

// TODO: SecondViewControllerのdelegateを準拠する
class ViewController: UIViewController, SecondViewControllerDelegate {
    func secondViewController(_ viewController: SecondViewController, didTapButton button: UIButton) {
        dismiss(animated: true) {
            guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController  else {
                             return
                         }
                   secondViewController.delegate = self
            self.present(secondViewController, animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTapped(_ sender: UIButton) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController  else {
                  return
              }
        secondViewController.delegate = self
        secondViewController.modalTransitionStyle = .flipHorizontal
        present(secondViewController, animated: true, completion: nil)
        // TODO: secondViewControllerのdelegateを自分にセット
        // TODO: present(viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
    }

    // TODO: SecondViewController の delegateメソッドを実装
}

