//
//  ViewController.swift
//  UserDefaultSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urls = FileManager().urls(for: .documentDirectory, in: .userDomainMask)
        print(urls.first)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let array: [String] = (0..<10).map { "\($0)" }
        UserDefaults.standard.set(array, forKey: "array")
        let saveDict = [ "textField1" : "\(textField1.text ?? "")", "textField2" : "\(textField2.text ?? "")" ]
        guard let fileUrl = fileUrl() else {return}
        if NSKeyedArchiver.archiveRootObject(saveDict, toFile: fileUrl.path) {
            print("success")
        } else {
            print("failed")
        }
    }
    func fileUrl() -> URL? {
        let urls = FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask)
        guard let url = urls.first else {
            return nil
        }
        let newUrl = url.appendingPathComponent("save.dat")
        return newUrl
    }
    @IBAction func readButtonTapped(_ sender: UIButton) {
        guard let fileUrl = fileUrl() else {return}
        if FileManager.default.fileExists(atPath: fileUrl.path) { //[1] ファイルパスが存在するかどうかを確認
            guard let readDict = NSKeyedUnarchiver.unarchiveObject(withFile: fileUrl.path) as? [String : String] else { return }
            print(readDict)
            textField1.text = readDict["textField1"]
            textField2.text = readDict["textField2"]
        } else {
            print("not exist")
        }
    }
    
    @IBAction func readSettingButtonTapped(_ sender: UIButton) {
        guard let text = UserDefaults.standard.string(forKey: "next_text_field") else { return }
        print("next_text_field = " + text)
        let jsonString = "{" +
        "    \"employees\" : [" +
        "        { \"lastName\" : \"Doe\", \"firstName\" : \"John\" }," +
        "        { \"lastName\" : \"Smith\", \"firstName\" : \"Anna\" }," +
        "        { \"lastName\" : \"Jones\", \"firstName\" : \"Peter\" }" +
        "    ]" +
        "}"
        let data = jsonString.data(using: String.Encoding.utf8)!
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(object)
        } catch let e {
            print(e)
        }
    }
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let fileUrl = fileUrl() else {
            print("not exist")
            return
        }
        do {
            try FileManager.default.removeItem(atPath: fileUrl.path)
            textField1.text = ""
            textField2.text = ""
        } catch {
            print("failed")
        }
    }
}

