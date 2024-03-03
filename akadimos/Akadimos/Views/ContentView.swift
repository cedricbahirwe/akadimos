//
//  ContentView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

enum InStorageKeys {
    static let appTab = "tabSelection"
    static let isTabVisible = "isTabVisible"
    static let isLoggedIn = "isLoggedIn"
    static let enableDarkMode = "enableDarkMode"
    static let enablePushNotifications = "enablePushNotifications"
}
struct ContentView: View {
    @AppStorage(InStorageKeys.appTab) private static var defaultTab = TabItem.home
    @State private var tabSelection = defaultTab
    @AppStorage(InStorageKeys.isLoggedIn) private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            MainTabView(selection: $tabSelection) {
                activeTabScreen()
            }
            .onChange(of: tabSelection) { oldValue, newValue in
                ContentView.defaultTab = newValue
            }
        } else {
            NavigationStack {
                GettingStartedView()
            }
        }
    }
    
    @ViewBuilder
    func activeTabScreen() -> some View {
        switch tabSelection {
        case .home:
            HomeScreen()
        case .map:
            MapScreen()
        case .search:
            SearchScreen()
        case .activity:
            ActivityScreen()
        case .profile:
            ProfileScreen()
        }
    }
}

#Preview {
    ContentView()
}
