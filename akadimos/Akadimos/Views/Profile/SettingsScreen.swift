//
//  SettingsScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 29/02/2024.
//

import SwiftUI

struct SettingsScreen: View {
    @AppStorage("enableDarkMode") private var enableDarkMode = false
    @AppStorage("enablePushNotifications") private var enablePushNotifications = false
    
    var body: some View {
        List {
            Section {
                Link(destination: URL(string: "https://www.apple.com")!) {
                    Label(
                        title: { Text("Privacy Settings") },
                        icon: { Image.lockCircle }
                    )
                    .tint(.primary)
                }
                
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Label(
                        title: { Text("Change Password") },
                        icon: { Image.sunFill }
                    )
                }

    
            }
            
            Section {
                Toggle(isOn: $enableDarkMode) {
                    Label(
                        title: { Text("Enable Dark Mode") },
                        icon: { Image.lockCircle }
                    )
                }
                
                Toggle(isOn: $enablePushNotifications) {
                    Label(
                        title: { Text("Enable Push Notifications") },
                        icon: { Image.bellFill }
                    )
                }
                
            }
            .tint(Color.accentColor)

        }
        .safeAreaInset(edge: .top) {
            NavBarView("Settings")
        }
        .background(.primaryBackground)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        SettingsScreen()
    }
}
