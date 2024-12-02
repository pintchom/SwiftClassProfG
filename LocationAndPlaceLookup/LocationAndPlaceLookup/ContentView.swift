//
//  ContentView.swift
//  LocationAndPlaceLookup
//
//  Created by Max Pintchouk on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var locationManager = LocationManager()
    @State var selectedPlace: Place?
    @State private var sheetIsPresented = false
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(selectedPlace?.name ?? "n/a")
                    .font(.title2)
                Text(selectedPlace?.address ?? "n/a")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                Text("\(selectedPlace?.latitude ?? 0.0), \(selectedPlace?.longitude ?? 0.0)")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                sheetIsPresented.toggle()
            } label: {
                Image(systemName: "location.magnifyingglass")
                Text("Location Search")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)

        }
        .padding()
        .task {
            if let location = locationManager.location {
                selectedPlace = await Place(location: location)
            }
            locationManager.locationUpdated = { location in
                Task {
                    selectedPlace = await Place(location: location)
                }
            }
            
        }
        .sheet(isPresented: $sheetIsPresented) {
            PlaceLookupView(locationManager: locationManager, selectedPlace: $selectedPlace)
        }
    }
}

#Preview {
    ContentView()
}
