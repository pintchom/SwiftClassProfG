//
//  Spot.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 11/10/24.
//

import Foundation
import FirebaseFirestore

struct Spot: Identifiable, Codable {
    @DocumentID var id: String?
    var name = ""
    var address = ""
    
    init(id: String? = nil, name: String = "", address: String = "") {
        self.id = id
        self.name = name
        self.address = address
    }
}

extension Spot {
    static var preview: Spot {
        let newSpot = Spot(id: "1", name: "Boston Public Market", address: "Boston, MA")
        return newSpot
    }
}
