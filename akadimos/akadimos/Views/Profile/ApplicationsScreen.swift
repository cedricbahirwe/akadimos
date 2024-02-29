//
//  ApplicationsScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 29/02/2024.
//

import SwiftUI

struct ApplicationsScreen: View {
    var body: some View {
        Form {
            Section {
                HStack(spacing: 18) {
                    Image("house-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Parcon Apartment")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Text("RWF 200,000.0")
                            .foregroundStyle(.secondary)
                        
                        Text("Reviewing")
                            .foregroundStyle(.orange)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 100)
                .listRowInsets(EdgeInsets())
            } header: {
                HStack {
                    Text("Reviewing")
                        .foregroundStyle(.orange)
                    Spacer()
                    
                    Button("Cancel") { }
                        .textCase(nil)
                        .tint(.primary)
                        .fontWeight(.semibold)
                }
            }
            
            Section {
                Text("No items to show")
            } header: {
                Text("Cancelled")
                    .foregroundStyle(.blue)
            }
            
            Section {
                Text("No items to show")
            } header: {
                Text("Cancelled")
                    .foregroundStyle(.red)
            }
            
            
            Section {
                Text("No items to show")
            } header: {
                Text("Cancelled")
                    .foregroundStyle(.green)
            }
            
            
            
        }
        .formStyle(.grouped)
        .scrollContentBackground(.hidden)
        .fontWeight(.semibold)
        .background(.primaryBackground)
        .safeAreaInset(edge: .top) {
            NavBarView("Applications")
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ApplicationsScreen()
}
