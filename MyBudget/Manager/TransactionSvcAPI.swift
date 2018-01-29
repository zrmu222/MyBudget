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
    
    
    func retrieveAll(completionHandler: @escaping ([Transaction]?, Error?) -> Void){
        
        guard let url = URL(string: "https://laurenhybinette.com/MurphyZack.json") else {return}
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, responce, error) in
            
            guard let responceData = data else {
                print("Error: did not receive data")
                completionHandler(nil, error)
                return
            }
            print("Json File: \(responceData)")
            
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let transactions = try decoder.decode([Transaction].self, from: responceData)
                completionHandler(transactions, nil)
            } catch {
                print("Error trying to convert transaction json file")
                print(error)
                completionHandler(nil, error)
            }
        }
        task.resume()
        
    }
    
    
}
