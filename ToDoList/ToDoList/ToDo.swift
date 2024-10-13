//
//  ToDo.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftData
import Foundation

@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate: Date = Date.now + 60*60*24
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}
