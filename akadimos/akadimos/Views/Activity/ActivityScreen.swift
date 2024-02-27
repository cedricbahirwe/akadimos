//
//  ActivityScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

private enum TopBarItem: String, CaseIterable {
    case notifications
    case messages
}

struct ActivityScreen: View {
    @State private var selectedTab = TopBarItem.notifications
    @State private var activityData = ActivityData()
    
    private var activityItems: [any ActivityProtocol] {
        selectedTab == .notifications ? activityData.notifications : activityData.messages
    }

    var body: some View {
        List(activityItems, id: \.id) { item in
            ActivityRow(item: item)
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color.clear
                        .background(
                            .background,
                            in: .rect(cornerRadius: 10)
                        )
                    
                )
                .listRowSeparator(.hidden)
        }
        .listRowSpacing(10)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .padding(.horizontal)
        .background(.primaryBackground)
        .refreshable { }
        .safeAreaInset(edge: .top) {
            TopTabBar(selection: $selectedTab)
                .frame(maxWidth: .infinity)
                .padding([.horizontal, .bottom])
                .background(.primaryBackground.opacity(0.95))
        }
    }
    
    private struct ActivityRow: View {
        let item: any ActivityProtocol
        var body: some View {
            HStack(spacing: 16) {
                Image.normalStar
                VStack(alignment: .leading) {
                    if let author = item.getAuthor() {
                        Text(author)
                            .bold()
                    }
                    Text(item.title)
                    Text(item.subtitle)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
    }
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
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(selection == item ? .white : .primary)
                        .background(itemBackground(for: item))
                        .contentShape(.rect)
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
