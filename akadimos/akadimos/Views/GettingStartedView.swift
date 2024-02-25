//
//  GettingStartedView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

struct GettingStartedView: View {
    @Binding var navigationPath: [Route]

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
                Button(action: {}) {
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
                
                Button(action: {
                    navigationPath.append(.authentication)
                }) {
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
    GettingStartedView(navigationPath: .constant([]))
//        .preferredColorScheme(.dark)
}
