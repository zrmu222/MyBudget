//
//  DetailViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 11/17/17.
//  Copyright © 2017 Zachary Murphy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Public Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    var transaction: TransactionModel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - Private Properties


    // MARK: - <#superclass#>
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hidTextFields(hid: true)
        deleteButton.isHidden = true
        nameLabel.text = transaction.name
        categoryLabel.text = transaction.category
        priceLabel.text = "$" + transaction.price!
        dateLabel.text = transaction.date
        descriptionLabel.text = transaction.note
        nameTextField.text = transaction.name
        categoryTextField.text = transaction.category
        priceTextField.text = transaction.price
        dateTextField.text = transaction.date
        descriptionTextField.text = transaction.note
        
        NSLog("DetailView Loaded")
    }
    


    // MARK: - Public Methods


    // MARK: - Private Methods
    private func hidLabel(hid: Bool){
        nameLabel.isHidden = hid
        categoryLabel.isHidden = hid
        priceLabel.isHidden = hid
        dateLabel.isHidden = hid
        descriptionLabel.isHidden = hid
    }
    
    private func hidTextFields(hid: Bool){
        nameTextField.isHidden = hid
        categoryTextField.isHidden = hid
        priceTextField.isHidden = hid
        dateTextField.isHidden = hid
        descriptionTextField.isHidden = hid
    }
    
    // MARK: - <#delegate#>
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    // MARK: - Actions
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        
        if editButton.titleLabel?.text == "Edit" {
            sender.setTitle("Save", for: .normal)
            hidLabel(hid: true)
            hidTextFields(hid: false)
            deleteButton.isHidden = false
        }else {
            sender.setTitle("Edit", for: .normal)
            //hidTextFields(hid: true)
            hidLabel(hid: false)
            transaction.name = nameTextField.text
            transaction.category = categoryTextField.text
            transaction.price = priceTextField.text
            transaction.date = dateTextField.text
            transaction.note = descriptionTextField.text
            TransactionSvcCoreData.getInstance().update(transaction: transaction)
            self.viewWillAppear(true)
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        TransactionSvcCoreData.getInstance().delete(transaction: transaction)
        _ = navigationController?.popViewController(animated: true)
    }
    
}
