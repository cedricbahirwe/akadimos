//
//  TabBarView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case map
    case search
    case activity
    case profile
}
struct TabBarView: View {
    @Binding var selection: TabItem
    @Namespace var animation
    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { item in
                VStack(spacing: 4) {
                    Image(
                        selection == item ?
                        "tab.\(item.rawValue).active" :
                        "tab.\(item.rawValue)"
                    )
                    Text(item.rawValue.capitalized)
                        .scaleEffect(selection == item ? 1 : 0.9)
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        selection = item
                    }
                }
                .foregroundStyle(
                    selection == item ? Color.accentColor : Color.primary)
                .overlay(alignment: .bottom) {
                    if selection == item {
                        Color.blue
                            .frame(height: 5)
                            .clipShape(.rect(topLeadingRadius: 5, topTrailingRadius: 5))
                            .padding(.horizontal, 10)
                            .padding(.top, 2)
                            .matchedGeometryEffect(id: "active", in: animation)

                    } else {
                        Color.clear
                            .frame(height: 5)
                            .matchedGeometryEffect(id: item, in: animation)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabBarView(selection: .constant(.home))
}
