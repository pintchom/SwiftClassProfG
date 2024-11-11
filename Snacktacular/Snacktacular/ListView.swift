//
//  ListView.swift
//  Snacktacular
//
//  Created by Max Pintchouk on 11/4/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct ListView: View {
    @FirestoreQuery(collectionPath: "spots") var spots: [Spot]
    @Environment(\.dismiss) private var dismiss
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            List(spots) { spot in
                NavigationLink {
                    SpotDetailView(spot: spot)
                } label: {
                    Text(spot.name)
                        .font(.title2)
                }

            }
            .listStyle(.plain)
            .navigationTitle("Snack Spots:")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sign Out") {
                        do {
                            try Auth.auth().signOut()
                            print("Logout Successful")
                            dismiss()
                        } catch {
                            print("ERROR: Could not sign out")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    SpotDetailView(spot: Spot())
                }
            }
        }
    }
}

#Preview {
    ListView()
}
