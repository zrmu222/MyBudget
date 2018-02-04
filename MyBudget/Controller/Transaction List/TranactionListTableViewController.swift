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
    var transactionList: [Transaction] = []
    var sectionNames = ["Transaction", "Total"]
    
    let transactionSvc = TransactionSvcAPI.sharedInstance
    
    
    
    @IBOutlet weak var addTransactionButton: UIBarButtonItem!
    // MARK: - Private Properties
    
    
    // MARK: - <#superclass#>
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getTransactionList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "showTransaction"?:
            NSLog("SectionNumber: \(String(describing: tableView.indexPathForSelectedRow?.section))")
            if tableView.indexPathForSelectedRow?.section == 0{
                if let row = tableView.indexPathForSelectedRow?.row {
                    let tranx = transactionList[row]
                    let detailViewController = segue.destination as! DetailViewController
                    detailViewController.transaction = tranx
                }
            }else{
            }
        case "addTransaction"?:
            _ = segue.destination as! AddTransactionViewController
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    func getTotal() -> Double {
        var total: Double = 0.0
        for t in transactionList {
            if let price = Double(t.price!) {
                total += price
            }
        }
        return total
    }
    
    func getTransactionList(){
        let activitySpinner:UIActivityIndicatorView = UIActivityIndicatorView (activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activitySpinner.center = self.view.center
        self.view.addSubview(activitySpinner)
        activitySpinner.bringSubview(toFront: self.view)
        activitySpinner.startAnimating()
        transactionList.removeAll()
        transactionSvc.retrieveAll(completionHandler: {(transactions, error) in
            if error == nil {
                DispatchQueue.main.async {
                    for(_, value) in transactions! {
                        self.transactionList.append(value)
                    }
                    activitySpinner.stopAnimating()
                    activitySpinner.hidesWhenStopped = true
                    self.tableView.reloadData()
                }
            }else {
                DispatchQueue.main.async {
                    activitySpinner.stopAnimating()
                    activitySpinner.hidesWhenStopped = true
                }
                print("Unexpected error occured")
            }
        })
        self.tableView.reloadData()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    
    // MARK: - <#delegate#>
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return transactionList.count
        }else {
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell
        // Configure the cell...
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TableViewCell
            cell.transaction = transactionList[indexPath.row]
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: "TotalCell", for: indexPath) as! TableViewCell
            cell.nameLabel.text = "Total"
            cell.priceLabel.text = "$\(getTotal())"
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
//                            forRowAt indexPath: IndexPath){
//        if indexPath.section == 0 {
//            if editingStyle == .delete {
//                let tranx = transactionList[indexPath.row]
//                transactionManager.delete(transaction: tranx)
//                self.transactionList = transactionManager.retrieveAll()
//                self.tableView.deleteRows(at: [indexPath], with: .automatic)
//                self.tableView.reloadData()
//            }
//        }
//    }
    
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
