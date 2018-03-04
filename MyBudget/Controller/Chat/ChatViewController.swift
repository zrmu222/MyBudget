//
//  ChatViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 3/3/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var chatRef: DatabaseReference!
    var msse652: DatabaseHandle!
    var messages = [String]()
    
    @IBOutlet weak var chatMessage: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "SegueToLogin", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("Entering loadTable")
        chatRef = Database.database().reference(withPath: "chat")
        msse652 = chatRef.child("MSSE 652").observe(.value, with: { snapshot in
            self.messages = [String]()
            for item in snapshot.children {
                let child = item as! DataSnapshot
                print("Child: \(child)")
                let value = child.value as! String
                let message = value as String
                self.messages.append(message)
            }
            self.tableView.reloadData()
        })
        NSLog("Exiting loadTable")
    }
    
    
    @IBAction func sendChat(_ sender: Any) {
        let message = chatMessage.text
        if message != "" {
            chatRef.child("MSSE 652").childByAutoId().setValue(message)
            chatMessage.text = ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("Number of rows")
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("cellForRowAt")
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ChatCell") as UITableViewCell!
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    
    
    
    
    
}
