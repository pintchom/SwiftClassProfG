// File: FriendsGivingApp.swift Project: FriendsGiving
// Created by: Prof. John Gallaugher on 10/28/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import SwiftUI
import SwiftData

@main
struct FriendsGivingApp: App {
    var body: some Scene {
        WindowGroup {
            GuestListView()
                .modelContainer(for: Guest.self)
        }
    }
    
    // Will allow us to find the path where our simulator data is saved:
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
