//
//  TransactionManagers.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/12/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class TransactionsManager {
    
    // MARK: - Public Properties
    var transactionList = [Transaction]()
    static let transactionManager = TransactionsManager()
    
    // MARK: - Private Properties
    
    
    // MARK: - <#superclass#>
    
    
    // MARK: - Public Methods
    func addTransaction(transaction: Transaction){
        transactionList.append(transaction)
    }
    
    func removeTransaction(transaction: Transaction){
        if let index = transactionList.index(of: transaction){
            transactionList.remove(at: index)
        }
    }
    
    // MARK: - Private Methods
    
    
    // MARK: - <#delegate#>
    
    
    // MARK: - Actions
}
