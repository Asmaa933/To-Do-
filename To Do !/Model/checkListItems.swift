//
//  checkListItems.swift
//  To Do !
//
//  Created by AsMaa on 3/10/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
class checkListItems: NSObject {
    var text = ""
    var checked = false
    
    init(text : String) {
        self.text = text
    }
    init(text : String , checked : Bool) {
        self.text = text
        self.checked = checked
    }
    func toggleChecked() {
        checked = !checked
    }
}
