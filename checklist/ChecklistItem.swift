//
//  ChecklistItem.swift
//  checklist
//
//  Created by money on 2021/8/20.
//

import Foundation
class ChecklistItem:NSObject, Codable {
  var text = ""
  var checked = false
    func toggleChecked(){
        checked = !checked
    }
    
}
