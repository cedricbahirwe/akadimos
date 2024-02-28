//
//  GettingStartedView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Welcome to")
                Text("Akadimos.")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(Color.accentColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
            
            Image("buy-house")
            
            Text("Discover your ideal\n boarding house.")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            VStack(spacing: 15) {
                NavigationLink {
                    AuthenticationView()
                } label: {
                    Text("Are you a user?")
                        .fontWeight(.heavy)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            .ultraThickMaterial,
                            in: .rect(cornerRadius: 15)
                        )
                        .foregroundStyle(.foreground)
                }
                
                
                NavigationLink {
                    AuthenticationView()
                } label: {
                    Text("Are you owner?")
                        .fontWeight(.heavy)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.accentColor,
                            in: .rect(cornerRadius: 15)
                        )
                        .foregroundStyle(.white)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GettingStartedView()
}
