//
//  MainTabView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

struct MainTabView<Content> : View where Content : View {
    @Binding var selection: TabItem
    
    var contentView: () -> Content
    var body: some View {
        VStack(spacing: 0) {
            contentView()
                .frame(maxHeight: .infinity)
            TabBarView(selection: $selection)
        }
    }
}

#Preview {
    MainTabView(selection: .constant(.home)) {
        HomeScreen(navigationPath: .constant([]))
    }
}
