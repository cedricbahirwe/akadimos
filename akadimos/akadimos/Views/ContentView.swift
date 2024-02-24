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
    
    var body: some View {
        NavigationStack(path: $navPath) {
            WelcomeView(navigationPath: $navPath)
                .task(performInitialNavigationSetup)
                .navigationDestination(for: Route.self, destination: handleDestinationRoute)

        }
    }
    
    @ViewBuilder
    private func handleDestinationRoute(_ route: Route) -> some View {
        switch route {
        case .login:
            LoginView(navigationPath: $navPath)
        case .home:
            HomeView(navigationPath: $navPath)
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
