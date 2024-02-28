//
//  NavBarView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct NavBarView<TrailingContent>: View where TrailingContent: View {
    private let title: LocalizedStringKey
    private let onGoBack: () -> Void
    private let trailingItem: () -> TrailingContent
    
    init(_ title: LocalizedStringKey,
         onGoBack: @escaping () -> Void,
         trailingItem: @escaping () -> TrailingContent = { EmptyView() }) {
        self.title = title
        self.onGoBack = onGoBack
        self.trailingItem = trailingItem
    }
    
    var body: some View {
        HStack(spacing: 18) {
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
                .frame(maxWidth: .infinity, alignment: .leading)
            
            trailingItem()
        }
        .padding([.horizontal, .bottom])
        .background(.ultraThinMaterial)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    NavBarView("Title Goes here",  onGoBack: {})
}
