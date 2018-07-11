//
//  FeedbackViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 3/9/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation
import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()
    }
    
    
    func initWebView() {
//        webView.loadRequest(NSURLRequest (url: NSURL(string: "https://www.google.com")! as URL) as URLRequest)
        
        webView.loadRequest(NSURLRequest(url: Bundle.main.url(forResource: "Feedback", withExtension: "html", subdirectory: "")!) as URLRequest)
    }
    
    
    
}
