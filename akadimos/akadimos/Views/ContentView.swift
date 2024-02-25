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
    @State private var navPath: [Route] = []
    @State private var tabSelection = TabItem.home
    
    var body: some View {
        NavigationStack(path: $navPath) {
            GettingStartedView(navigationPath: $navPath)
                .task(performInitialNavigationSetup)
                .navigationDestination(for: Route.self, destination: handleDestinationRoute)
        }
    }
    
    @ViewBuilder
    private func handleDestinationRoute(_ route: Route) -> some View {
        switch route {
        case .authentication:
            AuthenticationView(navigationPath: $navPath)
        case .home:
            MainTabView(selection: $tabSelection) {
                activeTabScreen()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
    
    @ViewBuilder
    func activeTabScreen() -> some View {
        switch tabSelection {
        case .home:
            HomeScreen(navigationPath: $navPath)
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
