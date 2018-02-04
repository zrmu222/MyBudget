//
//  Transaction.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/12/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class Transaction: Codable{
    
    // MARK: - Public Properties
    var name: String?
    var category: String?
    var price: String?
    var date: String?
    var note: String?
    
    init(){
        
    }
    
//    init(name: String, category: String,
//         price: String, date: String, description: String){
//        self.name = name
//        self.category = category
//        self.price = price
//        self.date = date
//        self.note = description
//    }
    

}
