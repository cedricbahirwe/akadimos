//
//  NavBarView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct NavBarView: View {
    private let title: LocalizedStringKey
    private let onGoBack: () -> Void
    
    init(_ title: LocalizedStringKey, onGoBack: @escaping () -> Void) {
        self.title = title
        self.onGoBack = onGoBack
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                onGoBack()
            }) {
                Label("Go back", systemImage: "chevron.left")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .labelStyle(.iconOnly)
                    .frame(width: 35, height: 35)
                    .background(.blue, in: .rect(cornerRadius: 8))
                    .foregroundStyle(.white)
            }
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.horizontal, .bottom])
        .background(.ultraThinMaterial)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    NavBarView("Title Goes here",  onGoBack: {})
}
