//
//  EditView.swift
//  Places
//
//  Created by Max Pintchouk on 11/4/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var city: String = ""
    @State private var country: String = ""
    @State var place: Place
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Country:")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("Country", text: $country)
                    .textFieldStyle(.roundedBorder)
                    .font(.title)
                    .padding(.bottom)
                Text("City:")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("City", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .font(.title)
                    .padding(.bottom)
            }
            .padding()
            .onAppear {
                city = place.city
                country = place.country
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }

            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    place.city = city
                    place.country = country
                    modelContext.insert(place)
                    guard let _ = try? modelContext.save() else {
                        return
                    }
                    dismiss()
                } label: {
                    Text("Save")
                }
                .disabled(city == "" && country == "")

            }
        }
    }
}

#Preview {
    NavigationStack {
        EditView(place: Place())
            .modelContainer(for: Place.self, inMemory: true)
    }
}
