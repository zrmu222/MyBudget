//
//  TransactionAPI.swift
//  MyBudget
//
//  Created by Zachary Murphy on 1/28/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation
import Alamofire


class TransactionSvcAPI: NSObject {
    
    static let sharedInstance = TransactionSvcAPI()
    
    
    func retrieveAll(completionHandler: @escaping ([String : Transaction]?, Error?) -> Void){
        
        Alamofire.request("https://mybudget-fcdbd.firebaseio.com/transactions.json").responseJSON { responce in
            
            guard let value = responce.data else {
                print("Error: did not receive data")
                completionHandler(nil, responce.error)
                return
                }
            
            guard responce.error == nil else {
                completionHandler(nil, responce.error)
                return
                }
            
            let decoder = JSONDecoder()
            do {
                let transactions = try decoder.decode([String : Transaction].self, from: value)
                completionHandler(transactions, nil)
                } catch {
                    print("Error trying to convert transaction json file")
                    print(error)
                    completionHandler(nil, responce.error)
                }
        }
    }
    
    func create(transaction:Transaction, completion:((Error?) -> Void)?) {
        guard let url = URL(string: "https://mybudget-fcdbd.firebaseio.com/transactions.json") else {return}

            Alamofire.request(url, method: .post, parameters: transaction.convertToDictionary(), encoding:JSONEncoding.default).response { responce in
                if(responce.error != nil){
                    NSLog("Error posting transaction : \(responce.error)")
                }
                
                completion?(responce.error)
            }
    }
}
