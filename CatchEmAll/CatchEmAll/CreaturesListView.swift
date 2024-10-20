//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Max Pintchouk on 10/19/24.
//

import SwiftUI

struct CreaturesListView: View {
    @State var creatures = Creatures()
    var body: some View {
        NavigationStack {
            List(creatures.creaturesArray, id:\.self) { creature in
                Text(creature.name)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .task { //just like on appear but async
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
