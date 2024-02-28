//
//  ProfileScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationStack {
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
                    labeledView("Bookmarks", .profileBookmark) { }
                    labeledView("Applications", .profileDocument) { }
                    labeledView("Help", .profileQuestion) { }
                    labeledView("Settings", .profileSettings) { }
                    labeledView("Logout", .profileLogout) { }
                    
                    Spacer()
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(.primaryBackground)
        }
    }
    
    @ViewBuilder
    func labeledView(_ title: LocalizedStringKey, _ image: Image, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(
                title: { Text(title).fontWeight(.medium) },
                icon: { image }
            )
            .tint(.primary)
        }
    }
}

#Preview {
    ProfileScreen()
}
