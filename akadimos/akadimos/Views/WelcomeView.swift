//
//  WelcomeView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
          
            ZStack(alignment: .bottom) {
                
                Image("welcome-1")
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .topLeading) {
                        Text("Rent a House\nfor you.")
                            .font(.largeTitle.weight(.black))
                            .foregroundStyle(.white.shadow(.inner(color: .gray, radius: 2, x: 5)))
                            .padding(.horizontal, 50)
                            .offset(y: -25)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                   
            }
            
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Book Now")
                    .font(.title2)
                    .textCase(.uppercase)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 40)
                    .background(Color.btnDarkBlue, in: .rect(cornerRadius: 30))
            }
            .padding(25)
            .frame(maxWidth: .infinity)
            .background(Image("welcome-svg").resizable().scaledToFill())

        }
        .background(.primaryDarkBlue)
        .foregroundStyle(.white)
    }
}

#Preview {
    WelcomeView()
}
