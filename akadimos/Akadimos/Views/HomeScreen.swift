//
//  HomeScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct HomeScreen: View {
    private let rows = [
        GridItem(.fixed(70), spacing: 20),
        GridItem(.fixed(70), spacing: 20)
    ]
    @Environment(\.isPresented) private var isPresented
    @AppStorage(InStorageKeys.isTabVisible) private var isTabVisible = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Your Location")
                    
                    HStack {
                        Text("Kigali City, Kimironko")
                            .font(.title2.weight(.bold))
                        Image.arrowSwap
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                HStack {
                    SearchField("", text: .constant(""))
                        .accessoryAction(.filterMagnify) {
                            
                        }
                        .shadow(color: .offBlackShadow, radius: 15, x: 10, y: 10)
                        .shadow(color: .offWhiteShadow, radius: 15, x: -10, y: -10)
                }
                .padding(.horizontal)
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) { i in
                                NavigationLink {
                                    ListingDetailsScreen()
                                        .onAppear() {
                                            isTabVisible = false
                                        }
                                } label: {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            RatingLabel(value: 4)
                                                .tint(.yellow)  
                                            Spacer()
                                            ZStack {
                                                Image.bookmark
                                                
                                                Image(systemName: Bool.random() ? "plus" : "checkmark")
                                                    .imageScale(.small)
                                                    .fontWeight(.bold)
                                                    .foregroundStyle(.white)
                                            }
                                        }
                                        .padding()
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            Text("RWF 200.000")
                                            
                                            Text("Rowhouse")
                                                .font(.title)
                                            
                                            Text("3 kms away")
                                        }
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .lineLimit(1)
                                        
                                    }
                                    .padding(.trailing, 8)
                                    .frame(width: 300, height: 250)
                                    .background(Image("house-3"))
                                    .background(.black.opacity(0.5))
                                    .background(.regularMaterial)
                                    .clipShape(.rect(cornerRadius: 12))
                                }                            }
                        }
                        .padding(.leading)
                    }
                } header: {
                    Text("Near You")
                        .font(.title.weight(.bold))
                        .padding(.horizontal)
                }
                
                
                Spacer().frame(height: 16)
                
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(1..<10) { i in
                                NavigationLink {
                                    ListingDetailsScreen()
                                        .onAppear() {
                                            isTabVisible = false
                                        }
                                } label: {
                                    HStack {
                                        
                                        Color.black.opacity(0.2)
                                            .frame(width: 80)
                                            .overlay {
                                                Image("house-\(min(i, 3))")
                                                    .resizable()
                                            }
                                        
                                        VStack(alignment: .leading) {
                                            Text("JCS House")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            Text("RWF 200,000/month")
                                            
                                        }
                                        .padding(.trailing, 8)
                                    }
                                    .frame(width: 290, alignment: .leading)
                                    .background(.background)
                                    .clipShape(.rect(cornerRadius: 9))
                                    .foregroundStyle(.foreground)
                                }
                            }
                        }
                        .padding(.leading)
                    }
                } header: {
                    Text("New Listings")
                        .font(.title.weight(.bold))
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .background(.primaryBackground)
            .toolbar(.hidden, for: .navigationBar)
            .onAppear() {
                isTabVisible = true
            }
        }
    }
}

#Preview {
    HomeScreen()
}

struct RatingLabel: View {
    let value: Int
    var body: some View {
        HStack {
            Image.magicStar
                .renderingMode(.template)
            Text("\(value)")
                .bold()
//                .foregroundStyle(.yellow)
        }
        .foregroundStyle(.tint)
        
    }
}
