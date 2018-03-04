//
//  ChatLoginViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 3/3/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ChatLoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func loginFirebase(_ sender: Any) {
        if username?.text != "" {
            Auth.auth().signInAnonymously(completion: { (user, error) in
                if let err = error {
                    NSLog("Exception: \(err.localizedDescription)")
                    return
                }
                self.performSegue(withIdentifier: "SegueToChat", sender: nil)
            })
        }

    }
    
}
