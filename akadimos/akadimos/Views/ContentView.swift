//
//  ContentView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var navPath = NavigationPath([Route.welcome])
    var body: some View {
        NavigationStack(path: $navPath) {
            WelcomeView(navigationPath: $navPath)
        }
        .navigationDestination(for: Route.self, destination: handleDestinationRoute)
    }
    
    @ViewBuilder
    private func handleDestinationRoute(_ route: Route) -> some View {
        switch route {
        case .welcome:
            WelcomeView(navigationPath: $navPath)
        case .login:
            LoginView(navigationPath: $navPath)
        case .home:
            HomeView(navigationPath: $navPath)
        }
    }
    
}

#Preview {
    ContentView()
}

enum Route {
    case welcome
    case login
    case home
}
