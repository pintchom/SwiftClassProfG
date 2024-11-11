// File: GuestListView.swift Project: FriendsGiving
// Created by: Prof. John Gallaugher on 10/28/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import SwiftUI
import SwiftData

struct GuestListView: View {
    @Query var guests: [Guest]
    @Environment(\.modelContext) var modelContext
    @State private var presentSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(guests) { guest in
                    NavigationLink {
                        GuestDetailView(guest: guest)
                    } label: {
                        Text(guest.name)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Friends:")
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
        .sheet(isPresented: $presentSheet) {
            NavigationStack {
                GuestDetailView(guest: Guest())
            }
        }
    }
}

#Preview {
    NavigationStack {
        GuestListView()
            .modelContainer(Guest.preview)
    }
}
