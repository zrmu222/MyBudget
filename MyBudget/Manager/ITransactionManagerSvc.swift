//
//  ITransactionManagerSvc.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/22/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import Foundation

protocol ITransactionManagerSvc {
    
    func addTransaction(transaction: Transaction)
    func updateTransaction(oldTransaction: Transaction, newTransaction: Transaction)
    func deleteTransaction(transaction: Transaction)
}