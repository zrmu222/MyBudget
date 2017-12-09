//
//  TransactionModel+CoreDataProperties.swift
//  MyBudget
//
//  Created by Zachary Murphy on 12/6/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//
//

import Foundation
import CoreData


extension TransactionModel {


    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var price: String?
    @NSManaged public var date: String?
    @NSManaged public var note: String?

}
