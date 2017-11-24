//
//  TableViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/12/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class TranactionListTableViewController: UITableViewController {
    
    
    // MARK: - Public Properties
    var transactionList = [Transaction]()
    
    // MARK: - Private Properties
    
    
    // MARK: - <#superclass#>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionList = TransactionManager.transactionManager.transactionList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        transactionList = TransactionManager.transactionManager.transactionList
        self.tableView.reloadData()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showTransaction"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let tranx = transactionList[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.transaction = tranx
            }
        case "addTransaction"?:
            _ = segue.destination as! AddTransactionViewController
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    
    // MARK: - <#delegate#>
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return transactionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TableViewCell
        cell.transaction = transactionList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let tranx = TransactionManager.transactionManager.transactionList[indexPath.row]
            TransactionManager.transactionManager.deleteTransaction(transaction: tranx)
            self.transactionList = TransactionManager.transactionManager.transactionList
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Actions
    @IBAction func toggleEditingMode(_ sender: UIButton){
        // If you are currently in editing mode...
        if isEditing {
            // Change text button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            //Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
    



}
