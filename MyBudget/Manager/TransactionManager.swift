//
//  TransactionManager.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/22/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class TransactionManager: ITransactionManagerSvc {
    
    
    // MARK: - Public Properties
    var transactionList = [Transaction]()
    static let transactionManager = TransactionManager()
    
    let transactionArchiveURL: URL = {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectory = directory.first!
        return documentDirectory.appendingPathComponent("transaction.archive")
    }()
    
    // MARK: - Private Properties
    
    
    // MARK: - <#superclass#>
    
    
    // MARK: - Public Methods
    init() {
        if let archivedTransactions = NSKeyedUnarchiver.unarchiveObject(withFile: transactionArchiveURL.path) as? [Transaction] {
            transactionList = archivedTransactions
        }
    }
    
    func addTransaction(transaction: Transaction){
        transactionList.append(transaction)
        let success = saveTransactionList()
        if success {
            NSLog("Transaction: \(String(describing: transaction.name)) successfully saved.")
        }else{
            NSLog("Tranaction: \(String(describing: transaction.name)) not saved!")
        }
    }
    
    func updateTransaction(oldTransaction: Transaction, newTransaction: Transaction) {
        
        if let index = transactionList.index(of: oldTransaction){
            transactionList.remove(at: index)
            addTransaction(transaction: newTransaction)
            NSLog("Transaction: \(oldTransaction) updated to \(newTransaction)")
        }
        
    }
    
    func deleteTransaction(transaction: Transaction) {
        if let index = transactionList.index(of: transaction){
            transactionList.remove(at: index)
        }
        let success = saveTransactionList()
        if success {
            NSLog("Transaction: \(String(describing: transaction.name)) successfully saved.")
        }else{
            NSLog("Tranaction: \(String(describing: transaction.name)) not saved!")
        }
    }
    
    // MARK: - Private Methods
    private func saveTransactionList() -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(transactionList, toFile: self.transactionArchiveURL.path)
        return success
    }
    
    // MARK: - <#delegate#>
    
    // MARK: - Actions
}

