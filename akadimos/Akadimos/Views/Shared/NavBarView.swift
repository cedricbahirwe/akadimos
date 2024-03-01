//
//  NavBarView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct NavBarView<TrailingContent>: View where TrailingContent: View {
    private let title: LocalizedStringKey
    private let onGoBack: (() -> Void)?
    private let trailingItem: () -> TrailingContent
    private var hidesBackground = false
    @Environment(\.dismiss) private var dismiss
    
    init(_ title: LocalizedStringKey,
         trailingItem: @escaping () -> TrailingContent = { EmptyView() },
         onGoBack: (() -> Void)? = nil) {
        self.title = title
        self.onGoBack = onGoBack
        self.trailingItem = trailingItem
    }
    
    var body: some View {
        HStack(spacing: 18) {
            Button(action: {
                if let onGoBack {
                    onGoBack()
                } else {
                    dismiss()
                }
            }) {
                Label("Go back", systemImage: "chevron.left")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .labelStyle(.iconOnly)
                    .frame(width: 35, height: 35)
                    .background(.blue.opacity(0.8), in: .rect(cornerRadius: 8))
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
        .background(.ultraThinMaterial.opacity(hidesBackground ? 0 : 1))
    }
}

extension NavBarView {
    func hidesBackground(_ hidden: Bool = true) -> some View {
        var view = self
        view.hidesBackground = hidden
        return view
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavBarView("Title Goes here",  onGoBack: {})
}
