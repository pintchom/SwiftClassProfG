//
//  Creature.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import Foundation

struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name, url
    }
}
