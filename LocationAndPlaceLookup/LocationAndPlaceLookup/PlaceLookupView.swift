//
//  PlaceLookupView.swift
//  LocationAndPlaceLookup
//
//  Created by Max Pintchouk on 12/1/24.
//

import SwiftUI
import MapKit

struct PlaceLookupView: View {
    let locationManager: LocationManager
    @Binding var selectedPlace: Place?
    @State var placeVM = PlaceViewModel()
    @State private var searchTask: Task<Void, Never>?
    @State private var searchText: String = ""
    @State private var searchRegion = MKCoordinateRegion()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            Group {
                if searchText.isEmpty {
                    ContentUnavailableView("No results", systemImage: "mappin.slash")
                } else {
                    List(placeVM.places) { place in
                        VStack (alignment: .leading) {
                            Text(place.name)
                                .font(.title2)
                            Text(place.address)
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .onTapGesture {
                            selectedPlace = place
                            dismiss()
                        }
                        
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Location Search")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .onAppear {
            searchRegion = locationManager.getRegionAroundCurrentLocation() ?? MKCoordinateRegion()
        }
        .onDisappear {
            searchTask?.cancel()
        }
        .onChange(of: searchText) { oldVale, newValue in
            searchTask?.cancel()
            guard !newValue.isEmpty else {
                placeVM.places.removeAll()
                return
            }
            searchTask = Task {
                do {
                    try await Task.sleep(for: .milliseconds(300))
                    if Task.isCancelled {return}
                    if searchText == newValue {
                        try await placeVM.search(text: newValue, region: searchRegion)
                    }
                } catch {
                    if !Task.isCancelled {
                        print("😡 Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

#Preview {
    PlaceLookupView(locationManager: LocationManager(), selectedPlace: .constant(Place(mapItem: MKMapItem())))
}
