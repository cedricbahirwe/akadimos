//
//  SearchScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchEntry = "Calapan"
    var body: some View {
        List(0..<20) { i in
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 10) {
                    Image("avatar-1")
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
                
                Image("search-1")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text("Kimironko apartment")
                        .font(.title2)
                    
                    Text("200,000 RWF/month")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
                .padding(10)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .background(
                .background
                    .shadow(.inner(color: .offBlackShadow, radius: 15, x: 10, y: 10))
                    .shadow(.inner(color: .offWhiteShadow, radius: 15, x: -10, y: -10))
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
                }

                SearchField("", text: $searchEntry)
                    .accessoryAction(.filterMagnify) { }
                    .padding(.vertical, 10)
            }
            .padding(.horizontal)
            .background(.primaryBackground.opacity(0.95))
        }
    }
}

#Preview {
    NavigationStack {
        SearchScreen()
    }
}
