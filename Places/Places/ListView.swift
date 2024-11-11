//
//  ContentView.swift
//  Places
//
//  Created by Max Pintchouk on 11/4/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var places: [Place]
    @State private var presentSheet = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(places) { place in
                    NavigationLink {
                        EditView(place: place)
                    } label: {
                        VStack (alignment: .leading){
                            Text(place.country)
                                .font(.title)
                            Text(place.city)
                                .font(.body)
                        }
                    }

                }
            }
            .listStyle(.plain)
            .navigationTitle("Places:")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        
        .fullScreenCover(isPresented: $presentSheet, content: {
            NavigationStack {
                EditView(place: Place())
            }
        })
        .padding()
    }
}

#Preview {
    NavigationStack {
        ListView()
            .modelContainer(Place.preview)
    }
}
