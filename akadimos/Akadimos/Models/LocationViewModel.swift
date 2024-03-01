//
//  LocationViewModel.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI
import MapKit

final class LocationViewModel: ObservableObject {
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var cameraPosition: MapCameraPosition = .automatic
    
    
    @Published var showLocationList: Bool = false
    
    @Published var showSheet: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            updateCameraPosition(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func updateCameraPosition(_ region: MKCoordinateRegion) {
        cameraPosition = MapCameraPosition.region(region)
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonClicked() {
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {return}
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
