//
//  ViewController.swift
//  TableViewSample
//
//  Created by 鈴木 大貴 on 2016/10/24.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

//TODO: - UITableViewDataSourceとUITableViewDelegateを継承
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
               
        tableView.delegate = self
        tableView.dataSource = self
        //TODO: - delegateとdataSourceを登録f
        
        //TODO: - Cellを登録]
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
//TODO: - UITableViewDataSourceの実装
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        //cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") else {
//            return
//        }
//        viewController.title = "\(indexPath.row)"
//        navigationController?.pushViewController(viewController, animated: true)
//    }
}

