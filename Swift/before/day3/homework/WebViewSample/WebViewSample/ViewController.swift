//
//  ViewController.swift
//  WebViewSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    
    // TODO: ボタン変数を追加
    var backButton: UIBarButtonItem = { return UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(ViewController.backButtonTapped))}()
    var forwardButton: UIBarButtonItem = { return UIBarButtonItem(title: "forward", style: .plain, target: self, action: #selector(ViewController.forwardButtonTapped(_ :)))}()
    var reloadButton: UIBarButtonItem =  { return UIBarButtonItem(title: "reload", style: .plain, target: self, action: #selector(ViewController.reloadButtonTapped(_ :)))}()
    var observation: NSKeyValueObservation?
    var observation2: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        guard let url = URL(string: "https://github.com/apple") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        // TODO: toolbarにボタンを追加
        navigationController?.isToolbarHidden = false
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        toolbarItems = [backButton, forwardButton, reloadButton]
        
        // TODO: KVOでwebView.canGoBack, webView.canGoForwardを監視
        observation = webView.observe( \.canGoBack, options: [.old, .new]) { [weak self](_, canGoback) in
            if let hoge = canGoback.newValue {
                self?.backButton.isEnabled = hoge
            }
        }
        observation2 = webView.observe( \.canGoForward, options: [.old, .new]) { [weak self](_, canGoForward) in
            if let hoge = canGoForward.newValue {
                self?.forwardButton.isEnabled = hoge
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: toolbarのボタンが押された時の処理
    @objc func backButtonTapped(_ sender: UIBarButtonItem) {
              webView.goBack()
       }
    @objc func forwardButtonTapped(_ sender: UIBarButtonItem) {
           webView.goForward()
    }
    @objc func reloadButtonTapped(_ sender: UIBarButtonItem) {
              webView.reload()
       }
    
}

extension ViewController: WKNavigationDelegate {
    // TODO: 読み込み完了のデリゲートメソッド追加、タイトルの変更など
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(navigationAction.request.url)
        decisionHandler(.allow)
    }
}
