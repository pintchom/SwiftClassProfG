//
//  Creatures.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import Foundation

@Observable
class Creatures {
    
    private struct Returned: Codable {
        var count: Int
        var next: String? //TODO: make optional
        var results: [Creature]
    }
    
    
    var urlstring = "https://pokeapi.co/api/v2/pokemon"
    var count = 0
    var creaturesArray: [Creature] = []
    
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
            Task { @MainActor in
                self.count = returned.count
                self.urlstring = returned.next ?? ""
                self.creaturesArray += returned.results
            }
            print("JSON RETURNED! count: \(returned.count), next: \(String(describing: returned.next))")
        } catch {
            print("COULD NOT GET DATA FROM URL")
        }
    }
}
