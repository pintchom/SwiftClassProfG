//
//  Place.swift
//  LocationAndPlaceLookup
//
//  Created by Max Pintchouk on 12/1/24.
//

import Foundation
import MapKit
import Contacts

struct Place: Identifiable {
    let id = UUID().uuidString
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        self.mapItem.name ?? ""
    }
    var latitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.latitude
    }
    var longitude: Double {
        self.mapItem.placemark.coordinate.longitude
    }
    var address: String {
        let postalAddress = mapItem.placemark.postalAddress ?? CNPostalAddress()
        var address = CNPostalAddressFormatter().string(from: postalAddress)
        address = address.replacingOccurrences(of: "\n", with: ", ")
        return address
    }
}
