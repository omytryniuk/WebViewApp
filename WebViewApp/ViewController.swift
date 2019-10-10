//
//  ViewController.swift
//  WebViewApp
//
//  Created by Oleg Mytryniuk on 2019-10-09.
//  Copyright © 2019 Oleg Mytryniuk. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var loadWebPageButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        self.activityIndicator.isHidden = true
//        webView.
    }

    @IBAction func loadWebPage(_ sender: UIButton) {
        let url: String = "https://www.google.com"
        if let completeURL = URL(string: url) {
            let urlRequest: URLRequest = URLRequest(url: completeURL)
            webView.load(urlRequest)
        }
    }
    
    //WebView started loading
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.statusLabel.text = "Loading...."
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    //WebView completed loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.statusLabel.text = "Completed"
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    
    
}

