//
//  TransactionAPI.swift
//  MyBudget
//
//  Created by Zachary Murphy on 1/28/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import Foundation

class TransactionSvcAPI: NSObject {
    
    static let sharedInstance = TransactionSvcAPI()
    
    
    func retrieveAll(completionHandler: @escaping ([String: Transaction]?, Error?) -> Void){
        
        
        guard let url = URL(string: "https://mybudget-fcdbd.firebaseio.com/transactions.json") else {return}
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, responce, error) in
            
            guard let responceData = data else {
                print("Error: did not receive data")
                completionHandler(nil, error)
                return
            }
            
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let transactions = try decoder.decode([String: Transaction].self, from: responceData)
                completionHandler(transactions, nil)
            } catch {
                print("Error trying to convert transaction json file")
                print(error)
                completionHandler(nil, error)
            }
        }
        task.resume()
        
    }
    
    func create(transaction:Transaction, completion:((Error?) -> Void)?) {
        guard let url = URL(string: "https://mybudget-fcdbd.firebaseio.com/transactions.json") else {return}
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(transaction)
            request.httpBody = jsonData
        } catch {
            completion?(error)
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responceData, responce, responceError) in
            guard responceError == nil else {
                completion?(responceError)
                return
            }
            
            if let data = responceData, let utf8Representation = String(data: data, encoding: .utf8) {
                print("Responce: ", utf8Representation)
                completion?(nil)
            } else {
                print("no readable data received in responce")
            }
        }
        task.resume()
    }
    
    
    
}
