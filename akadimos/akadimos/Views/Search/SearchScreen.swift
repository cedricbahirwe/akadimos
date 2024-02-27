//
//  SearchScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchEntry = "Calapan"
    @State private var isSearching = false
    @State private var showFilter = false
    @State private var filterData: FilterData = .default
    private var showFilterResults: Bool {
        !showFilter && (filterData != FilterData.default)
    }
    
    var body: some View {
        List {
            
            if showFilterResults {
                FilterResultsView(result: filterData)
                    .listRowBackground(
                        Color.clear
                            .background(
                                BackgroundStyle.background
                                    .shadow(.inner(color: .offBlackShadow, radius: 15, x: 10, y: 10))
                                    .shadow(.inner(color: .offWhiteShadow, radius: 15, x: -10, y: -10))
                            )
                    )
                    .transition(.opacity)
            }
            
            ForEach(1..<20) { i in
                SearchItemRow(i: i)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                Color.clear
                    .background(
                        .background
                            .shadow(.inner(color: .offBlackShadow, radius: 15, x: 10, y: 10))
                            .shadow(.inner(color: .offWhiteShadow, radius: 15, x: -10, y: -10))
                    )
            )
        }
        .listSectionSpacing(020)
        .listRowSpacing(20)
        .scrollContentBackground(.hidden)
        .background(.primaryBackground)
        .refreshable { }
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                HStack {
                    Text("Search")
                        .font(.title.bold())
                    Spacer()
                    Image.filterGlass
                        .onTapGesture {
                            withAnimation {
                                showFilter.toggle()
                            }
                        }
                }
                
                VStack(alignment: .leading) {
                    SearchField("", text: $searchEntry)
                        .accessoryAction(.filterMagnify) {
                            withAnimation {
                                isSearching.toggle()
                            }
                        }
                    
                    if isSearching {
                        Text("Showing 3 results for \"\(searchEntry)\"")
                            .font(.title3)
                            .fontWeight(.medium)
                            .transition(
                                .asymmetric(
                                    insertion: .push(from: .top),
                                    removal: .push(from: .bottom)
                                )
                            )

                    }
                }
                    .padding(.vertical, 10)
            }
            .padding(.horizontal)
            .background(.primaryBackground.opacity(0.95))
        }
        .sheet(isPresented: $showFilter) {
            FilterView(filter: filterData) { newData in
                withAnimation {
                    self.filterData = newData
                }
                showFilter = false
            }
            .presentationDetents([.height(520)])
        }
    }
}


private extension SearchScreen {
    struct SearchItemRow: View {
        let i: Int
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 10) {
                    Image("avatar-\(Int.random(in: 1...3))")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .background(.ultraThinMaterial, in: .circle)
                    
                    VStack(alignment: .leading) {
                        Text("Placeholder")
                            .fontWeight(.medium)
                        Text("Owner")
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding(10)
                
                Image("search-\(Int.random(in: 1...5))")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text("Kimironko apartment")
                        .font(.title2)
                    
                    Text("RWF 200,000/month")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
                .padding(10)
            }
        }
    }
    
    struct FilterView: View {
        @State var filter: FilterData
        var onFilter: (FilterData) -> Void
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text("Location").font(.title2).bold()
                
                TextField("Type a location", text: $filter.locationName)
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.regularMaterial, in: .rect(cornerRadius: 4))
                
                
                Gauge(value: filter.locationRadius, in: filter.locationRange) {
                    HStack {
                        Text("Distance").font(.title2).bold()
                        Spacer()
                        
                        Text(filter.locationRadiusText)
                            .padding(9)
                            .background(.regularMaterial, in: .rect(cornerRadius: 4))
                    }
                } currentValueLabel: {
                } minimumValueLabel: {
                    Text(filter.locationRange.lowerBound.formatted())
                } maximumValueLabel: {
                    Text(filter.locationRange.upperBound.formatted())
                }
                .gaugeStyle(.linearCapacity)
                .tint(
                    Gradient(colors: [.green, .orange, .red])
                )
                
                VStack(alignment: .leading) {
                    Text("Price Range").font(.title2).bold()
                    
                    Slider(value: $filter.estimatedPrice, in: filter.priceRange)
                }
                
                HStack  {
                    Text("RWF \(filter.priceRange.lowerBound.formatted())")
                        .padding(10)
                        .background(.regularMaterial, in: .rect(cornerRadius: 4))
                    
                    Color.primary
                        .frame(width: 18, height: 5)
                    
                    Text("RWF \(filter.priceRange.upperBound.formatted())")
                        .padding(10)
                        .background(.regularMaterial, in: .rect(cornerRadius: 4))
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ratings").font(.title2).bold()
                    RatingView(value: $filter.rating)
                }
                
                Button {
                    onFilter(filter)
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
                .padding(.top, 30)
            }
            .padding(20)
            .background(
                .background,
                in: .rect(cornerRadius: 12)
            )
        }
    }
    
    struct FilterResultsView: View {
        let result: FilterData
        var body: some View {
            VStack(alignment: .leading) {
                Text("Filtered Results")
                    .font(.title3)
                    .fontWeight(.medium)
                
                Label(
                    title: { Text(result.locationName)},
                    icon: { Image.locationCircle }
                )
                .labelStyle(MiniLabeledStyle())
                
                Label(
                    title: { Text(result.priceRangeText) },
                    icon: { Image.moneySquare }
                )
                
                HStack(spacing: 20) {
                    Label(
                        title: { Text(result.locationRadiusText) },
                        icon: { Image.discoverCircle }
                    )
                    
                    Label(
                        title: { Text("\(result.rating) stars") },
                        icon: { Image.normalStar }
                    )
                }
            }
            .labelStyle(MiniLabeledStyle())
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}


fileprivate struct MiniLabeledStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            configuration.icon
            configuration.title
        }
    }
}

private struct FilterData: Equatable {
    var locationName: String = ""
    var locationRadius: Double = 0
    let locationRange = 0...10_000.0
    
    var estimatedPrice: Double = 0
    let priceRange = 10_000...1_000_000.0
    
    var rating: Int = 0
    
    var priceRangeText: String {
        "RWF \(priceRange.lowerBound.formatted()) - RWF \(priceRange.upperBound.formatted())"
    }
    
    var locationRadiusText: String {
        "\((locationRadius/1000).formatted())kms"
    }
    
    static let `default` = FilterData(locationName: "Kigali City, Convention Center, KG 182", locationRadius: 6_000, estimatedPrice: 200_000, rating: 3)
    
}

#Preview("SearchScreen") {
    SearchScreen()
}

#Preview("SearchItemRow", traits: .sizeThatFitsLayout) {
    SearchScreen.SearchItemRow(i: 1)
}

#Preview("FilterView", traits: .sizeThatFitsLayout) {
    SearchScreen.FilterView(filter: .default, onFilter: { _ in })
}
