//
//  ViewController.swift
//  To Do !
//
//  Created by AsMaa on 3/9/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController , addItemViewControllerDelegate{
    
    
    let helpMethod = HelpingMethods()
    var items = [checkListItems]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addSegueId {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        } else if segue.identifier == editSegueId {
             let controller = segue.destination as! AddItemViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
               controller.itemToEdit = items[indexPath.row]
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateArray()
        tableView.tableFooterView = UIView()
    }
    func updateArray(){
        items.append(checkListItems(text: "Walk the dog"))
        items.append(checkListItems(text: "Brush my teeth"))
        items.append(checkListItems(text: "Learn iOS development"))
        items.append(checkListItems(text: "soccer practice"))
        items.append(checkListItems(text: "Eat ice cream"))
        items.append(checkListItems(text: "Watching a movie"))
        items.append(checkListItems(text: "Play football"))
        items.append(checkListItems(text: "Go to Gym"))
        
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var titles = ["sleep" , "go to cinema" , "call friend ", "visit uncle"]
        let randomNumber = Int(arc4random_uniform(UInt32(titles.count)))
        let title =  titles [(randomNumber)]
        let item = checkListItems(text: title, checked: true)
        items.append(item)
        tableView.reloadData()
    }
}

// tableView Methods
extension CheckListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        
        let item  = items[indexPath.row]
        
        helpMethod.configureText(for: cell, with: item)
        helpMethod.configureCheckMark(for: cell, at: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item  = items[indexPath.row]
            item.checked = !item.checked
            
            helpMethod.configureCheckMark(for: cell, at: item)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemviewController(_ controller: AddItemViewController, didFinishAdding item: checkListItems) {
        items.append(item)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    func addItemviewController(_ controller: AddItemViewController, didFinishEditing item: checkListItems) {
//        if let index =  items.index(of: item){
//        let indexPath = IndexPath(row: index, section: 0)
//        if let cell = tableView.cellForRow(at: indexPath){
//    helpMethod.configureText(for: cell, with: item)
//        }
//    }

navigationController?.popViewController(animated: true)
        tableView.reloadData()


    }
}
