//
//  CreatureDetail.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import Foundation

@Observable
class CreatureDetail {
    
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable {
        var other: Other
    }
    
    struct Other: Codable {
        var officialArtwork: OfficialArtwork
        
        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    struct OfficialArtwork: Codable {
        var front_default: String?
    }
    
    
    var urlstring = ""
    var height = 0.0
    var weight = 0.0
    var imageUrl = ""
    
    func getData() async {
        print("🕸️ We are accessing url \(urlstring)")
        guard let url = URL(string: urlstring)else {
            print("COULD NOT READ URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("Could not decode returned jsond ata")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.imageUrl = returned.sprites.other.officialArtwork.front_default ?? "n/a"
            print("JSON RETURNED! count: \(returned.height), next: \(returned.weight)")
        } catch {
            print("COULD NOT GET DATA FROM URL")
        }
    }
}
