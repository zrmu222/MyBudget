//
//  TransactionSvcCoreData.swift
//  MyBudget
//
//  Created by Zachary Murphy on 12/6/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import Foundation
import CoreData

class TransactionSvcCoreData {
    
    // MARK: - Public Properties
    var managedObjectContext: NSManagedObjectContext
    
    // MARK: - Private Properties
    private static var instance = TransactionSvcCoreData()
    
    // MARK: - <#superclass#>
    
    // MARK: - Init
    private init() {
        guard let modelURL = Bundle.main.url(forResource: "TransactionDataModel", withExtension: "momd") else {
            fatalError("Error loading Transaction Data Model")
        }
        guard let managedObjectModel = NSManagedObjectModel(contentsOf:modelURL) else {
            fatalError("Error initializing TransactionDataModel: \(modelURL)")
        }
        
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        let persistenceStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        self.managedObjectContext.persistentStoreCoordinator = persistenceStoreCoordinator
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let storeURL = directory.appendingPathComponent("TransactionCoreData.sqlite")
        NSLog("storeURL: \(storeURL.path)")
        
        do {
            try persistenceStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        }catch {
            fatalError("Error Core Data Persistence Store: \(error)")
        }
    }
    
    
    // MARK: - Public Methods
    public static func getInstance() -> TransactionSvcCoreData {
        return instance;
    }
    
    public func createManagedObject() -> TransactionModel {
        let managedObject = NSEntityDescription.insertNewObject(forEntityName: "TransactionModel", into: managedObjectContext) as! TransactionModel
        return managedObject
    }
    
    
    public func create(transaction: TransactionModel){
        NSLog("Creating Transaction")
        
        do{
            try managedObjectContext.save()
        }catch {
            fatalError("Failure to save Transaction: \(error)")
        }
    }
    
    public func update(transaction: TransactionModel){
        NSLog("Updating Transaction")
        
        do{
            try managedObjectContext.save()
        }catch {
            fatalError("Failure to update Transaction: \(error)")
        }
    }
    
    public func delete(transaction: TransactionModel){
        NSLog("Delete Transaction")
        
        do {
            managedObjectContext.delete(transaction)
            try managedObjectContext.save()
        }catch {
            fatalError("Failure to delete transaction: \(error)")
        }
    }
    
    public func retrieveAll() -> [TransactionModel] {
        return getManagedObjects()
    }
    
    public func getCount() -> Int {
        return getManagedObjects().count
    }
    

    // MARK: - Private Methods
    private func getManagedObjects() -> [TransactionModel] {
        let transactionFetch = NSFetchRequest<TransactionModel>(entityName: "TransactionModel")
        do{
            let transactions = try managedObjectContext.fetch(transactionFetch)
            return transactions
        }catch {
            fatalError("Failure to fetch Transactions: \(error)")
        }
    }
    
    // MARK: - <#delegate#>
    
    
    // MARK: - Actions

    
}
