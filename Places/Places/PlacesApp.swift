//
//  PlacesApp.swift
//  Places
//
//  Created by Max Pintchouk on 11/4/24.
//

import SwiftUI
import SwiftData

@main
struct PlacesApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .modelContainer(for: Place.self)
        }
    }
}
