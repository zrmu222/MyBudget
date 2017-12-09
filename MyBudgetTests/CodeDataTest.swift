//
//  CodeDataTest.swift
//  MyBudgetTests
//
//  Created by Zachary Murphy on 12/9/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import XCTest
@testable import MyBudget

class CodeDataTest: XCTestCase {
    
    let transactionManager = TransactionSvcCoreData.getInstance()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let transactionList = transactionManager.retrieveAll()
        if transactionList.count != 0 {
            for t in transactionList {
                transactionManager.delete(transaction: t)
            }
        }
        
    }


    func testCRUD(){
        
        let transaction = transactionManager.createManagedObject()
        transaction.name = "Starbucks"
        transaction.category = "Coffee"
        transaction.price = "3.67"
        transaction.date = "1/1/2017"
        transaction.note = "Morning Coffee"
        
        
        // Create new Transaction
        transactionManager.create(transaction: transaction)
        var list = transactionManager.retrieveAll()
        if list.count == 1 {
            assert(list[0].isEqual(transaction))
            NSLog("Create Transaction Test Passed")
        }else{
            NSLog("Create Transaction Test Failed.")
        }
        
        //Update Object
        transaction.price = "2.98"
        transactionManager.update(transaction: transaction)
        list = transactionManager.retrieveAll()
        if list.count == 1 {
            assert(list[0].isEqual(transaction))
            NSLog("Update Trsansaction Test Passed")
        }else{
            NSLog("Update Transaction Test Faileds")
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
}
