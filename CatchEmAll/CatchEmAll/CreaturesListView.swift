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
            ZStack {
                List(0..<creatures.creaturesArray.count, id:\.self) { i in
                    LazyVStack {
                        NavigationLink {
                            DetailView(creature: creatures.creaturesArray[i])
                        } label: {
                            Text("\(i+1). \(creatures.creaturesArray[i].name.capitalized)")
                                .font(.title2)
                        }
                    }
                    .task {
                        guard let lastCreature = creatures.creaturesArray.last else {
                            return
                        }
                        if creatures.creaturesArray[i].name == lastCreature.name && creatures.urlstring.hasPrefix("http") {
                            await creatures.getData()
                        }
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Pokemon")
                .toolbar {
                    ToolbarItem(placement: .status) {
                        Text("\(creatures.creaturesArray.count) of \(creatures.count) creatures")
                    }
                }
                if creatures.isLoading {
                    ProgressView()
                        .tint(.red)
                        .scaleEffect(4)
                }
            }
        }
        .task { //just like on appear but async
            await creatures.getData()
        }
    }
}

#Preview {
    CreaturesListView()
}
