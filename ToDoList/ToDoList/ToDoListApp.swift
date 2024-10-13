//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Max Pintchouk on 10/13/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    
    // Will allow us to find wehere our dimulator data is saves
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
