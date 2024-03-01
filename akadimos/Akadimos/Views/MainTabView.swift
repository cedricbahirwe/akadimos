//
//  MainTabView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

struct MainTabView<Content> : View where Content : View {
    @Binding var selection: TabItem
//    @AppStorage("isTabVisible") private var isTabVisible = true
    var contentView: () -> Content
    var body: some View {
        ZStack(alignment: .bottom) {
            
            contentView()
                .frame(maxHeight: .infinity)
                .padding(.bottom, InMemoryStorage.shared.isTabVisible() ? 70 : 0 )
            
            TabBarView(selection: $selection)
                .background(.primaryBackground)
                .opacity(InMemoryStorage.shared.isTabVisible() ? 1 : 0)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MainTabView(selection: .constant(.home)) {
        HomeScreen()
    }
}

import Foundation

class InMemoryStorage: ObservableObject {
    static let shared = InMemoryStorage()
    
    @Published private var showTabBar = true
    
    private init() {}
    
    func setTabVisibility(_ isVisible: Bool) {
        // Save data in memory
        self.showTabBar = isVisible
    }
    
    func isTabVisible() -> Bool {
        // Retrieve data from memory
        return showTabBar
    }
    
    func clearData() {
        // Clear data from memory
    }
}
