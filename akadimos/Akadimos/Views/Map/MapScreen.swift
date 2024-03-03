//
//  MapScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @StateObject private var locationVM = LocationViewModel()
    @State private var radius = 6.0
    @State private var showFilter = false
    var locationRadius: CGFloat { radius * 100 }
    
    @State private var showResults = false
    @State private var showScanner = false
    
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
            
            if showScanner {
                ScanLoadingView(isPresented: $showScanner, onFinish: {
                    showResults = true
                })
            }
        }
    }
    
    private var mapOverlayView: some View {
        VStack(spacing: 0) {
            VStack(spacing: 20) {
                
                SearchField("", text: .constant(""))
                    .accessoryAction(showResults ? .filterMagnify : .filterLined) {
                        withAnimation {
                            if showResults {
                                showResults = false
                            } else {
                                showFilter.toggle()
                            }
                        }
                    }
                
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
            .background(showResults ? .primaryBackground : .clear)
            
            if showResults {
                ScanResultsView()
            } else {
                Spacer()
                
                Button {
                    showScanner = true
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
}

private struct ScanResultsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Here's what we've found.")
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                ForEach(0 ..< 2) { item in
                    ScanResultRowView()
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .background(.primaryBackground)
    }
}

private struct ScanResultRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AvatarTitlePreview(image: "avatar-1",
                                   size: 50,
                                   title: "John Doe",
                                   subtitle: nil)
                
                Spacer()
                
                Text("500m")
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Kimironko apartment")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("RWF 200,000/Month")
                    .font(.title3)
                    .fontWeight(.medium)
                
                
                RatingLabel(value: 2)
                    .tint(.white)
            }
            .foregroundColor(.white)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 230)
        .background(
            LinearGradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
        )
        .background(
            Image("house-1")
                .resizable()
        )
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    MapScreen()
}

#Preview {
    ScanResultsView()
    
}
