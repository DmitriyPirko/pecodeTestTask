//
//  DetailedNewsViewController.swift
//  test
//
//  Created by Dmitriy on 18.02.2021.
//

import Foundation
import UIKit
import WebKit

class DetailedNewsViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        if let url = StorageManager.sharedManager.news.first?.articles[StorageManager.sharedManager.selectedNew].url {
            webView.loadRequest(URLRequest(url: url))
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
