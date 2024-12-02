//
//  LocationManager.swift
//  LocationAndPlaceLookup
//
//  Created by Max Pintchouk on 12/1/24.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    var location: CLLocation?
    private var locationManager = CLLocationManager()
    var errorMessage: String?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var locationUpdated: ((CLLocation) -> Void)?
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getRegionAroundCurrentLocation(radiusInMeters: CLLocationDistance = 10000) -> MKCoordinateRegion? {
        guard let location = location else {
            return nil
        }
        return MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radiusInMeters,
            longitudinalMeters: radiusInMeters
        )
    }
}

extension LocationManager {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {return}
        location = newLocation
        locationUpdated?(newLocation)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        errorMessage = error.localizedDescription
        print("Error 😡🗺️")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        
        switch manager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                manager.startUpdatingLocation()
            case .denied, .restricted:
                errorMessage = "Error 😡🗺️"
                manager.stopUpdatingLocation()
            case .notDetermined:
                print("Auth not yet determined")
                manager.requestWhenInUseAuthorization()
            @unknown default:
                manager.requestLocation()
        }
    }
}
