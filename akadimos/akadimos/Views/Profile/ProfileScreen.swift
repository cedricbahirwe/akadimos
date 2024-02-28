//
//  ProfileScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

private enum FlowRoute  {
    case bookmarks
    case applications
    case help
    case settings
    case editprofile
}

struct ProfileScreen: View {
    @State private var path: [FlowRoute] = []
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("tabSelection") private var tabSelection = TabItem.profile

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                VStack(spacing: 0) {
                    
                    HStack {
                        Image.notifAndroid
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(
                                LinearGradient(colors: [.red, .green, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 50, height: 50)
                            .clipShape(.circle)
                            .padding(5)
                            .background(.thinMaterial, in: .circle)
                            .padding(5)
                            .background(.ultraThinMaterial, in: .circle)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Cédric Bahirwe")
                                .font(.title2)
                                .bold()
                            
                            Text("@driosman")
                            
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        ZStack(alignment: .bottom) {
                            Color.blue
                                .frame(height: 140)
                                .ignoresSafeArea(.all, edges: .top)
                            
                            Ellipse()
                                .fill(.blue)
                                .frame(height: 100)
                                .offset(y: 50)
                            
                        }.ignoresSafeArea(edges: .top)
                        
                    )
                }
                .foregroundStyle(.white)
                .padding(.bottom, 50)
                
                Button(action: {
                    path.append(.editprofile)
                }, label: {
                    Label(
                        title: { Text("Edit Profile") },
                        icon: { Image.edit }
                    )
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .background(.thinMaterial, in: .rect(cornerRadius: 10))
                    .foregroundColor(.primary)
                })
                .padding(.top)
                .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 30) {
                    labeledView("Bookmarks", .profileBookmark) {
                        path.append(.bookmarks)
                    }
                    labeledView("Applications", .profileDocument) { }
                    labeledView("Help", .profileQuestion) {
                        path.append(.help)
                    }
                    labeledView("Settings", .profileSettings) { }
                    labeledView("Logout", .profileLogout) {
                        isLoggedIn = false
                        tabSelection = .home
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()

            }
            .background(.primaryBackground)
            .navigationDestination(for: FlowRoute.self, destination: handleDestinationRoute)
        }
    }
    
    @ViewBuilder
    private func handleDestinationRoute(_ route: FlowRoute) -> some View {
        switch route {
        case .editprofile:
            EditProfileScreen()
        case .bookmarks:
            BookmarksScreen()
        case .applications:
            fatalError()
        case .help:
            HelpScreen()
        case .settings:
            fatalError()
        }
    }
}

private extension ProfileScreen {
    @ViewBuilder
    func labeledView(_ title: LocalizedStringKey, _ image: Image, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(
                title: { Text(title).fontWeight(.medium) },
                icon: { image }
            )
            .tint(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ProfileScreen()
}
