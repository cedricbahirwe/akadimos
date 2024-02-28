//
//  HelpScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct HelpScreen: View {
    private let questions = [
        "How to rent?",
        "Can I filter boarding houses based on rental price range?",
        "How often is the boarding house listing updated?"
    ]
    var body: some View {
        List {
            Section {
                ForEach(questions, id: \.self) { question in
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text(question)
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.background)
                )
                .clipShape(.rect(cornerRadius: 15))
            } header: {
                Text("FAQs")
                    .font(.title.weight(.black))
                    .foregroundStyle(Color.accentColor)
                    .padding(.bottom, 8)
            }
            .listRowInsets(EdgeInsets())

        }
        .listRowSpacing(16)
        .scrollContentBackground(.hidden)
        .background(.primaryBackground)
        .safeAreaInset(edge: .top) {
            VStack(spacing: 0) {
                NavBarView("Help")

                VStack(alignment: .leading) {
                    SearchField("", text: .constant(""))
                        .accessoryAction(.filterMagnify, action: {})
                    
                    
                    Text("Your Source for Quick and Reliable Assistance")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .padding(.horizontal)
                .padding(.bottom)
                .background(.ultraThinMaterial)
            }
            
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HelpScreen()
//        .preferredColorScheme(.dark)
}
