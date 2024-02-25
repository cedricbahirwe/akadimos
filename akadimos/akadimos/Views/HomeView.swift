//
//  HomeView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct ActionItem: Identifiable {
    var id: String { title }
    
    let image: String
    let title: String
}


struct HomeView: View {
    @Binding var navigationPath: [Route]

    private let items: [ActionItem] = [
        .init(image: "near-by", title: "Near By"),
        .init(image: "click-room", title: "Book Room"),
        .init(image: "add-event", title: "Add Event"),
    ]
    
    private let foregroundGreen = Color(red: 29/255, green: 77/255, blue: 79/255)
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .padding()
                    
                    TextField("Search Now", text: .constant("Search Now"))
                }
                .frame(height: 50)
                .background(
                    foregroundGreen.opacity(0.15),
                    in: .rect(cornerRadius: 12)
                )
                
                Button {
                    
                } label: {
                    Image("filter-icon")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .frame(width: 50, height: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(
                                    foregroundGreen,
                                    lineWidth: 1
                                )
                        }
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                
                ForEach(items) { item in
                    VStack(spacing: 15) {
                        Image(item.image)
                        Text(item.title)
                            .font(.callout)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.background)
                    .clipShape(.rect(cornerRadius: 15))
                    .shadow(color: .offBlackShadow, radius: 15, x: 10, y: 10)
                    .shadow(color: .offWhiteShadow, radius: 15, x: -10, y: -10)
                    .fixedSize(horizontal: false, vertical: true)
                }
                
            }
            .padding(.horizontal)

            
            VStack(alignment: .leading) {
                Text("Category")
                    .font(.title2.weight(.bold))
                    .foregroundStyle(foregroundGreen)
                
                ScrollView(.horizontal) {
                    HStack {
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)

    }
}

#Preview {
    HomeView(navigationPath: .constant([]))
}
