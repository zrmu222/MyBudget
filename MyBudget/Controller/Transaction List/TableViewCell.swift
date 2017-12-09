//
//  TableViewCell.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/13/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Public Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var transaction: TransactionModel! {
        didSet{
            updateView()
        }
    }
    
    // MARK: - Private Properties
    
    // MARK: - <#superclass#>
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func updateView(){
        nameLabel.text = transaction.name!
        priceLabel.text = "$" + transaction.price!
    }
    
    // MARK: - <#delegate#>
    
    // MARK: - Actions

}
