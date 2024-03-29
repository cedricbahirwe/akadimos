//
//  BookmarksScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct BookmarksScreen: View {
    @State private var numbers = [1, 2, 3, 4, 5]
    var body: some View {
        List {
            ForEach(numbers, id: \.self) { item in
                HStack {
                    Image("house-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Parcon Apartment")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Text("Parcon Apartment")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.background)
                )
                .clipShape(.rect(cornerRadius: 15))
            }
        }
        .listStyle(.plain)
        .listRowSpacing(16)
        .scrollContentBackground(.hidden)
        .padding(.horizontal)
        .background(.primaryBackground)
        .safeAreaInset(edge: .top) {
            NavBarView("Bookmarks", trailingItem: {
                Button(action: {
                    withAnimation {
                        _ = numbers.removeLast()
                    }
                }) {
                    Label("Delete", systemImage: "trash")
                        .labelStyle(.iconOnly)
                        .padding(.vertical, 3)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(.white)
            })
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    BookmarksScreen()
}
