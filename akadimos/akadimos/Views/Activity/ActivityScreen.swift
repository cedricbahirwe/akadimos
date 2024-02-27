//
//  ActivityScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct ActivityScreen: View {
    @State private var selectedTab = TopBarItem.notifications

    var body: some View {
        ZStack {
            VStack {
                TopTabBar(selection: $selectedTab)
                
                List {
                    ForEach(0 ..< 15) { item in
                        Text("Something more \(item)")
                    }
                    //                    Spacer()
                }
                .scrollContentBackground(.hidden)
//                .listStyle(.plain)
            }
            .background(.primaryBackground)
        }
    }
}

private enum TopBarItem: String, CaseIterable {
    case notifications
    case messages
}

private extension ActivityScreen {
 
  
    struct TopTabBar: View {
        @Binding var selection: TopBarItem
        private let tabs = TopBarItem.allCases
        @Namespace private var animation
        var body: some View {
            HStack(spacing: 20) {
                ForEach(tabs, id: \.self) { item in
                    Text(item.rawValue.capitalized)
                        .padding()
                        .padding(.horizontal)
                        .foregroundStyle(selection == item ? .white : .primary)
                        .background(itemBackground(for: item))
                        .onTapGesture {
                            withAnimation(.interpolatingSpring) {
                                selection = item
                            }
                        }
                }
            }
        }
        
        @ViewBuilder
        func itemBackground(for item: TopBarItem) -> some View {
            if selection == item {
                Color.blue
                    .clipShape(.rect(cornerRadius: 10))
                    .matchedGeometryEffect(id: "active", in: animation)
            } else {
                Color.clear
                    .matchedGeometryEffect(id: item, in: animation)
                
            }
        }
    }
}

#Preview {
    ActivityScreen()
}
