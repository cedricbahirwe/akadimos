//
//  LocationAnnotationView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
        
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.regularMaterial)
                .padding(6)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 36))
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
//                .padding(.bottom, 40)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
