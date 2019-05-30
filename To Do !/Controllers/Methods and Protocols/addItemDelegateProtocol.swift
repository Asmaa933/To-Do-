//
//  addItemDelegateProtocol.swift
//  To Do !
//
//  Created by AsMaa on 3/11/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
protocol addItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel (_ controller : AddItemViewController)
    func addItemviewController(_ controller: AddItemViewController, didFinishAdding item: checkListItems)
      func addItemviewController(_ controller: AddItemViewController, didFinishEditing item: checkListItems)
}
