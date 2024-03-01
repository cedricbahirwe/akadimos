//
//  ContentView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tabSelection") private var tabSelection = TabItem.profile
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
//        if isLoggedIn {
            MainTabView(selection: $tabSelection) {
                activeTabScreen()
                    .toolbar(.hidden, for: .navigationBar)
            }
//        } else {
//            NavigationStack {
//                GettingStartedView()
//            }
//        }
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
