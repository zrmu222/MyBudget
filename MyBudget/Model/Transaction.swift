//
//  Transaction.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/12/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class Transaction: NSObject, NSCoding {
    
    // MARK: - Public Properties
    var name: String?
    var category: String?
    var price: String?
    var date: String?
    var note: String?
    var id: Int?
    
    // MARK: - Private Properties
    
    //MARK: - Init
    init(name: String, category: String,
         price: String, date: String, description: String){
        super.init()
        self.name = name
        self.category = category
        self.price = price
        self.date = date
        self.note = description
    }
    
    // MARK: - <#superclass#>
    
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    
    // MARK: - <#delegate#>
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(category, forKey: "category")
        coder.encode(price, forKey: "price")
        coder.encode(date, forKey: "date")
        coder.encode(note, forKey: "note")
        coder.encode(id, forKey: "id")
    }
    
    required init(coder decoder: NSCoder){
        name = decoder.decodeObject(forKey: "name") as? String
        category = decoder.decodeObject(forKey: "category") as? String
        price = decoder.decodeObject(forKey: "price") as? String
        date = decoder.decodeObject(forKey: "date") as? String
        note = decoder.decodeObject(forKey: "note") as? String
        id = decoder.decodeObject(forKey: "id") as? Int
    }
    
    // MARK: - Actions

}
