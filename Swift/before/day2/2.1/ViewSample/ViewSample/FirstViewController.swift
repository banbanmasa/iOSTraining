//
//  FirstViewController.swift
//  ViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 szk-atmosphere. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var frame: CGRect = .zero
        frame.origin.x = 10
        frame.origin.y = 100
        frame.size.width = 200
        frame.size.height = 50
        let view = UIView(frame: frame) // UIViewの初期化
        view.backgroundColor = .blue // デフォルトでは透明なので配置されてもわからない。そこで適当な色を入れておく
        self.view.addSubview(view) // viewを追加. self.viewはUIViewControllerのプロパティ
        var frame2: CGRect = .zero
        frame2.origin.x = 100
        frame2.origin.y = 10
        frame2.size.width = 10
        frame2.size.height = 10
        let button = UIButton(frame: frame2)
        button.backgroundColor = .green
        self.view.addSubview(button)
        let label = UILabel(frame: CGRect(x: 20, y: 600, width: 300, height: 21))
        label.text = "hogehoge aho!"
        self.view.addSubview(label)
        let textField = UITextField(frame: CGRect(x: 20, y: 200, width: 100, height: 21))
        textField.backgroundColor = .white
        self.view.addSubview(textField)
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 150, width: 128, height: 128))
        imageView.image = UIImage(named: "ojisan.png")
        self.view.addSubview(imageView)
        
        let imageView2 = UIImageView(frame: CGRect(x: 40, y: 250, width: 128, height: 128))
        imageView2.image = UIImage(named: "first.png")
        self.view.addSubview(imageView2)
        
        for view in view.subviews {
            if view is UIImageView {
                view.removeFromSuperview()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
