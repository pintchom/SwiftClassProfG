//
//  PlacesModel.swift
//  Places
//
//  Created by Max Pintchouk on 11/4/24.
//

import Foundation
import SwiftData

@Model
class Place {
    var city: String
    var country: String
    
    init(city: String, country: String) {
        self.city = city
        self.country = country
    }
    convenience init() {
        self.init(city: "", country: "")
    }
}

extension Place {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            container.mainContext.insert(Place(city: "New York", country: "USA"))
            container.mainContext.insert(Place(city: "Munich", country: "Germany"))
        }

        return container
    }
}
