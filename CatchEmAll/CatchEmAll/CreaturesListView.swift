//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = ["Pikachu", "Squirtle", "Charizard", "Snorlax"]
    var body: some View {
        NavigationStack {
            List(creatures, id:\.self) { creature in
                Text(creature)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
    }
}

#Preview {
    CreaturesListView()
}
