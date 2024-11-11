// File: Guest.swift Project: FriendsGiving
// Created by: Prof. John Gallaugher on 10/28/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import Foundation
import SwiftData

@MainActor
@Model
class Guest {
    var name: String
    var item: String
    var notes: String
    
    init(name: String = "", item: String = "", notes: String = "") {
        self.name = name
        self.item = item
        self.notes = notes
    }
}

extension Guest {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Guest.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add mock data
        container.mainContext.insert(Guest(name: "Snoop", item: "Brownies"))
        container.mainContext.insert(Guest(name: "Travis Kelce", item: "Ribs"))
        container.mainContext.insert(Guest(name: "Taylor Swift", item: "Cheese Steaks"))
        container.mainContext.insert(Guest(name: "Beyoncé", item: "Taco Salad"))
        
        return container
    }
}
