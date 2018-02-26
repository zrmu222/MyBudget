//
//  TransactionAPI.swift
//  MyBudget
//
//  Created by Zachary Murphy on 1/28/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation
//import Alamofire
import FirebaseDatabase


class TransactionSvcAPI: NSObject {

    static let sharedInstance = TransactionSvcAPI()


    func retrieveAll(completionHandler: @escaping ([Transaction]?, Error?) -> Void){
        var transactions = [Transaction]()
        let dbRef: DatabaseReference!
        dbRef = Database.database().reference().child("transactions")
        dbRef.observe(.value, with: { snapshot in
            
            if snapshot.childrenCount > 0 {
                for item in snapshot.children.allObjects as! [DataSnapshot] {
                    let data = item.value as? [String: AnyObject]
                    let transaction = Transaction()
                    transaction.name = data?["name"] as? String
                    transaction.category = data?["category"] as? String
                    transaction.price = data?["price"] as? String
                    transaction.date = data?["date"] as? String
                    transaction.note = data?["note"] as? String
                    transactions.append(transaction)
                    NSLog("Transaction added: \(transaction.name)")
                }
                completionHandler(transactions, nil)
            }
        })
        
    }
    
    func getAllTransactions() -> [Transaction] {
        var transactions = [Transaction]()
        let dbRef: DatabaseReference!
        dbRef = Database.database().reference().child("transactions")
        dbRef.observe(.value, with: { snapshot in

            if snapshot.childrenCount > 0 {
                for item in snapshot.children.allObjects as! [DataSnapshot] {
                    let data = item.value as? [String: AnyObject]
                    let transaction = Transaction()
                    transaction.name = data?["name"] as? String
                    transaction.category = data?["category"] as? String
                    transaction.price = data?["price"] as? String
                    transaction.date = data?["date"] as? String
                    transaction.note = data?["note"] as? String
                    transactions.append(transaction)
                    NSLog("Transaction added: \(transaction.name)")
                }
            }
        })
        
        return transactions
    }

    func create(transaction:Transaction, completion:((Error?) -> Void)?) {

        let dbRef: DatabaseReference!
        dbRef = Database.database().reference().child("transactions")
        let key = dbRef.childByAutoId().key
        let tranx = ["name": transaction.name,
                     "category": transaction.category,
                     "price": transaction.price,
                     "date": transaction.date,
                     "note": transaction.note]
        dbRef.child(key).setValue(tranx)
        completion?(nil)

    }
}

