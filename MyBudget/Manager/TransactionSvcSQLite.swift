//
//  TransactionSvcSQLite.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/30/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import Foundation
//class TransactionSvcSQLite: ITransactionManagerSvc {
//
//
//    // MARK: - Public Properties
//    var transactionList = [Transaction]()
//    static let transactionManager = TransactionSvcSQLite()
//
//    let dbURL: URL = {
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        var documentDirectory = directory.first!
//        return documentDirectory.appendingPathComponent("transaction.db")
//    }()
//
//    // MARK: - Private Properties
//
//
//    // MARK: - <#superclass#>
//
//
//    // MARK: - Public Methods
//    private init() {
//        NSLog("entering TransactionSvcSQLite.init")
//        NSLog("dbURL Path: \(self.dbURL.path as String)")
//        let fileManager = FileManager.default
//        //Create datebase if it doesnt exist
//        if !fileManager.fileExists(atPath: self.dbURL.path){
//            NSLog("Creating transactions datebase")
//            let transactionDb = FMDatabase(path: self.dbURL.path as String)
//            //Create Transaction table
//            NSLog("Creating transaction Table")
//            if transactionDb.open() {
//                let statment = "Create Table transactions (transactionId integer Primary Key Autoincrement, name varChar(20), category varChar(20), price varChar(20), transactionDate varChar(10), description varChar(50));"
//
//                if !transactionDb.executeStatements(statment) {
//                    NSLog("Error: \(transactionDb.lastErrorMessage())")
//                }
//                transactionDb.close()
//            }else {
//                NSLog("Error: \(transactionDb.lastErrorMessage())")
//            }
//        }else {
//            updateList()
//        }
//        NSLog("Exiting TransactionSvcSQLite.init")
//    }
//
//
//
//    func createTransaction(transaction: Transaction){
//        NSLog("Entering TransactionSvcSQLitte.addTransaction")
//        let transactionDb = FMDatabase(path: self.dbURL.path as String)
//        if transactionDb.open() {
//            let command = "Insert Into transactions (name, category, price, transactionDate, description) Values ('\(transaction.name!)', '\(transaction.category!)', '\(transaction.price!)', '\(transaction.date!)', '\(transaction.note!)')"
//
//            let result = transactionDb.executeUpdate(command, withArgumentsIn: [])
//            if result {
//                NSLog("Transaction Added")
//                transaction.id = Int(transactionDb.lastInsertRowId)
//                updateList()
//            }else {
//                NSLog("Error: \(transactionDb.lastErrorMessage())")
//            }
//            transactionDb.close()
//        } else {
//            NSLog("Error: \(transactionDb.lastErrorMessage())")
//        }
//
//    }
//
//    func updateTransaction(transaction: Transaction) {
//        NSLog("Entering TransactionSvcSQLite.updateTransaction")
//        let transactionDb = FMDatabase(path: self.dbURL.path as String)
//        if transactionDb.open() {
//            let command = "Update transactions Set name = '\(transaction.name!)', category = '\(transaction.category!)', price = '\(transaction.price!)', transactionDate = '\(transaction.date!)', description = '\(transaction.note!)' Where RowId = '\(transaction.id!)'"
//            let result = transactionDb.executeUpdate(command, withArgumentsIn: [])
//
//            if !result {
//                NSLog("Error: \(transactionDb.lastErrorMessage())")
//            }else{
//                NSLog("Transaction: \(transaction.id!) updated")
//                updateList()
//            }
//        }
//    }
//
//    func deleteTransaction(transaction: Transaction) {
//        NSLog("Entering TransactionSvcSQLite.deleteTransaction")
//        let transactionDb = FMDatabase(path: self.dbURL.path as String)
//        if transactionDb.open() {
//            let delete = "Delete from transactions Where RowId = \(transaction.id!)"
//            let result = transactionDb.executeUpdate(delete, withArgumentsIn: [])
//            if !result {
//                NSLog("Error: \(transactionDb.lastErrorMessage())")
//            }else {
//                NSLog("Transaction Deleted")
//                updateList()
//            }
//            transactionDb.close()
//        } else {
//            NSLog("Error: \(transactionDb.lastErrorMessage())")
//        }
//    }
//
//    func retrieveAll() -> [Transaction] {
//        return transactionList
//    }
//
//    // MARK: - Private Methods
//
//    private func updateList() {
//        NSLog("Updating transactionList")
//        let transactionDb = FMDatabase(path: self.dbURL.path as String)
//        transactionList.removeAll()
//        if transactionDb.open() {
//            let query = "Select * From transactions"
//            let results:FMResultSet? = transactionDb.executeQuery(query, withArgumentsIn: [])
//
//            while results?.next() == true {
//                let t = Transaction()
//                t.id = Int((results?.string(forColumn: "transactionId"))!)
//                t.name = (results?.string(forColumn: "name"))
//                t.category = (results?.string(forColumn: "category"))
//                t.price = (results?.string(forColumn: "price"))
//                t.date = (results?.string(forColumn: "TransactionDate"))
//                t.note = (results?.string(forColumn: "description"))
//                transactionList.append(t)
//            }
//            transactionDb.close()
//        }else {
//            NSLog("Error: \(transactionDb.lastErrorMessage())")
//        }
//    }
//
//
//    
//
//
//
//    // MARK: - <#delegate#>
//
//    // MARK: - Actions
//}

