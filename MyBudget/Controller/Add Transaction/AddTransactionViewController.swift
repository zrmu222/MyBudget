//
//  AddTransactionViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/12/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController, UITextFieldDelegate  {

    // MARK: - Public Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    // MARK: - Private Properties
    
    // MARK: - <#superclass#>
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.isHidden = true;
    }
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    // MARK: - <#delegate#>
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Actions
    @IBAction func addTransaction(_ sender: UIButton) {
        
        if let _ = Double(priceTextField.text!) {
            let transaction = Transaction(name: nameTextField.text!, category: categoryTextField.text!,
                                          price: "$" + priceTextField.text!, date: dateTextField.text!, description: descriptionTextField.text!)
            let manager = TransactionManager.transactionManager
            manager.addTransaction(transaction: transaction)
            
            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            NSLog("Transaction Added")
        }else {
            errorMessageLabel.text = "Please enter a valid price."
            errorMessageLabel.isHidden = false;
        }
    }
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
