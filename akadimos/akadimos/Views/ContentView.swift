//
//  ContentView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var navigationModel = NavigationModel()
    @SceneStorage("navigation") private var navigationData: Data?
    @State private var tabSelection = TabItem.profile
    @StateObject private var locationVM = LocationViewModel()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            MainTabView(selection: $tabSelection) {
                activeTabScreen()
                    .toolbar(.hidden, for: .navigationBar)
            }
        } else {
            GettingStartedView()
        }
    }
    
    @ViewBuilder
    func activeTabScreen() -> some View {
        switch tabSelection {
        case .home:
            HomeScreen()
        case .map:
            MapScreen()
                .environmentObject(locationVM)
        case .search:
            SearchScreen()
        case .activity:
            ActivityScreen()
        case .profile:
            ProfileScreen()
        }
    }
    
    @Sendable
    private func performInitialNavigationSetup() async {
//        if let navigationData {
//            navigationModel.jsonData = navigationData
//        }
//        
//
//        for await _ in navigationModel.objectWillChangeSequence {
//            navigationData = navigationModel.jsonData
//        }
    }
}

#Preview {
    ContentView()
}
