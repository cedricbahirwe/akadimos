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
                
                Image.welcomeSplash
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .topLeading) {
                        Text("Dicover your\nideal Place.")
                            .font(.largeTitle.weight(.black))
                            .fontDesign(.rounded)
                            .foregroundStyle(.white.shadow(.inner(color: .gray, radius: 2, x: 5)))
                            .padding(.horizontal, 40)
                            .offset(y: -25)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                   
            }
            
            
            Spacer()
            
            Button {
            } label: {
                Text("Get Started")
                    .font(.title2.weight(.bold))
                    .fontDesign(.rounded)
                    .padding(.vertical)
                    .padding(.horizontal, 40)
                    .background(Color.btnDarkBlue, in: .rect(cornerRadius: 30))
            }
            .padding(25)
            .frame(maxWidth: .infinity)
            .background(Image.welcomePolygone.resizable().scaledToFill())

        }
        .background(.primaryDarkBlue)
        .foregroundStyle(.white)
    }
}

#Preview {
    WelcomeView()
}
