//
//  AddItemViewController.swift
//  To Do !
//
//  Created by AsMaa on 3/11/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var addeditemTxtField: UITextField!
    
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    var itemToEdit: checkListItems?
    weak var delegate: addItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeToEdit()
       // addeditemTxtField.delegate = self
    }
    
    func changeToEdit(){
        if let item = itemToEdit{
            title = "Edit Item"
            addeditemTxtField.text = item.text
            doneBtn.isEnabled = true
        }
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        addeditemTxtField.resignFirstResponder()
//        return false
//    }
    override func viewWillAppear(_ animated: Bool) {
        addeditemTxtField.becomeFirstResponder()
    }
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
   
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func doneBtnPressed() {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = addeditemTxtField.text!
            delegate?.addItemviewController(self, didFinishEditing: itemToEdit)
        }else{
        let item = checkListItems(text: addeditemTxtField.text!)
       delegate?.addItemviewController(self, didFinishAdding: item)

        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         let oldText = addeditemTxtField.text!
        let stringRange = Range(range, in: oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
            doneBtn.isEnabled = false
        }else{
            doneBtn.isEnabled = true
        }
    return true
    }
  
}

