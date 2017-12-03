//
//  SQLiteTest.swift
//  MyBudgetTests
//
//  Created by Zachary Murphy on 12/2/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import XCTest
@testable import MyBudget

class SQLiteTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        NSLog("Setting up SQLiteTest Class")
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //Delete all rows in the table
        let transactionDb = FMDatabase(path: TransactionSvcSQLite.transactionManager.dbURL.path as String)
        if transactionDb.open() {
            let deleteRows = "Delete From Transactions"
            var result = transactionDb.executeStatements(deleteRows)
            if !result{
                NSLog("Error: \(transactionDb.lastErrorMessage())")
            }else {
                NSLog("All rows delete in transactions table")
            }
            //Reset RowId to 0
            let reset = "UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='transactions'"
            result = transactionDb.executeStatements(reset)
            if !result {
                NSLog("Error: \(transactionDb.lastErrorMessage())")
            }else {
                NSLog("RowID reset to 0")
            }
        }else {
            NSLog("Error: \(transactionDb.lastErrorMessage())")
        }
        
    }
    
    
    func testCRUD(){
        var t = Transaction()
        t.name = "Starbucks"
        t.category = "Coffee Shop"
        t.price = "3.56"
        t.date = "12/2/2017"
        t.note = "Coffee"
        
        
        //Add transactions Test
        NSLog("-------------Starting Add Test---------")
        TransactionSvcSQLite.transactionManager.createTransaction(transaction: t)
        var passed = false
        var transactionList = TransactionSvcSQLite.transactionManager.retrieveAll()
        for transaction in transactionList {
            if transaction.name == t.name{
                passed = true
                t = transaction
            }
        }
        assert(passed)
        NSLog("---------------TEST ADD TRANSACTION PASSED------------------")
        
        //Update Transaction Test
        
        NSLog("--------------Starting Update Test------------")
        passed = false
        t.price = "2.98"
        TransactionSvcSQLite.transactionManager.updateTransaction(transaction: t)
        transactionList = TransactionSvcSQLite.transactionManager.retrieveAll()
        for transaction in transactionList {
            if transaction.price == t.price{
                passed = true
            }
        }
        assert(passed)
        NSLog("---------------TEST UPDATE TRANSACTION PASSED------------------")
        
        //Delete Transaction Test
        TransactionSvcSQLite.transactionManager.deleteTransaction(transaction: t)
        transactionList = TransactionSvcSQLite.transactionManager.retrieveAll()
        assert(transactionList.count == 0)
        NSLog("---------------TEST DELETE TRANSACTION PASSED------------------")
    }

    
    
    
    
    
    
}
