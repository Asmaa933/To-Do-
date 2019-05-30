//
//  helpingMethods.swift
//  To Do !
//
//  Created by AsMaa on 3/10/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
import UIKit
class HelpingMethods{
    func configureCheckMark(for cell: UITableViewCell, at item: checkListItems){
       let label = cell.viewWithTag(checkMarkTag) as! UILabel
        
        if item.checked{
            label.text = "✔︎"
        } else {
            label.text = " "
            
        }
    }
    func configureText(for cell: UITableViewCell , with item: checkListItems){
        let label = cell.viewWithTag(LabelcellTag) as! UILabel
        label.text = item.text
        
    }
}
