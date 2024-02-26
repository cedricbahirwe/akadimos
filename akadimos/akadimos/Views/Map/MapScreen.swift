//
//  MapScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @EnvironmentObject private var locationVM: LocationViewModel
    @State private var radius = 6.0
    @State private var showFilter = false
    var locationRadius: CGFloat { radius * 100 }
    
    var body: some View {
        ZStack {
            Map(position: $locationVM.cameraPosition, interactionModes: .all)  {
                ForEach(locationVM.locations) { location in
                    Annotation(location.name, coordinate: location.coordinates) {
                        LocationMapAnnotationView()
                            .scaleEffect(locationVM.mapLocation == location ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture {
                                locationVM.showNextLocation(location: location)
                            }
                    }
                }
                .annotationTitles(.hidden )
                
                
                MapCircle(center: LocationsDataService.userLocation, radius: locationRadius)
                    .foregroundStyle(.blue.opacity(0.3))
                    .stroke(.red)
                
                
                //            UserAnnotation()
            }
            //        .onMapCameraChange(frequency: .continuous) { mapCameraUpdateContext in
            //            locationVM.updateCameraPosition(mapCameraUpdateContext.region)
            //        }
            .mapStyle(.imagery(elevation: .realistic))
            //        .mapStyle(.standard(elevation: .realistic, pointsOfInterest: .excludingAll))
            
            
            mapOverlayView
        }
    }
    
    private var mapOverlayView: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    TextField("", text: .constant(""))
                    Image.searchFilter
                        .onTapGesture {
                            withAnimation {
                                showFilter.toggle()
                            }
                        }
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    .background,
                    in: .rect(cornerRadius: 12)
                )
                
                if showFilter {
                    VStack(alignment: .leading) {
                        Text("Location").font(.title2).bold()
                        
                        Text("Kigali City, Convention Center, KG 182 St, 300")
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.regularMaterial, in: .rect(cornerRadius: 8))
                        
                        
                        Gauge(value: radius, in: 0...20) {
                            HStack {
                                Text("Radius").font(.title2).bold()
                                Spacer()
                                
                                Text("\(radius.formatted())kms")
                                    .padding(9)
                                    .background(.regularMaterial, in: .rect(cornerRadius: 8))
                            }
                        } currentValueLabel: {
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("20")
                        }
                        .gaugeStyle(.linearCapacity)
                        .tint(
                            Gradient(colors: [.green, .orange, .red])
                        )
                        
                        Button {
                            withAnimation {
                                showFilter.toggle()
                            }
                        } label: {
                            Text("Filter")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 35)
                        }
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 8)
                    }
                    .padding(20)
                    .background(
                        .background,
                        in: .rect(cornerRadius: 12)
                    )
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .top),
                            removal: .push(from: .bottom)
                        )
                    )
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
            } label: {
                Text("Scan Area")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 40)
            }
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .buttonStyle(.borderedProminent)
            .padding(.vertical, 20)
        }
    }
}


#Preview {
    MapScreen()
        .background(.gray)
        .environmentObject(LocationViewModel())
}
