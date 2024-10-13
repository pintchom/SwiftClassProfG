//
//  ToDo.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftData
import Foundation

@MainActor
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
extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now with iOS 16 and XCode 18", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Macedonian Educator", reminderIsOn: true, dueDate: Date.now + 60*60*44, notes: "They want to learn about entrepreneurship", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Post Flyers for Swift in Santiago", reminderIsOn: true, dueDate: Date.now + 60*60*72, notes: "To be held in UAH in Chile", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Prepare old iPhone for Lily", reminderIsOn: true, dueDate: Date.now + 60*60*12, notes: "She gets my old pro", isCompleted: false))
        return container
    }
}
