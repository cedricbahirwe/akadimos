//
//  RatingView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 27/02/2024.
//

import SwiftUI

// TODO: - Support Sliding Interaction
struct RatingView: View {
    @Binding private var rating: Int
    private var tintColor: Color = .blue
    private var otherColor: Color = .primary
    
    init(value: Binding<Int>) {
        let initialValue = min(max(0, value.wrappedValue), 5)
        
        self._rating = Binding(
            get: { initialValue },
            set: { newValue in
                value.wrappedValue = newValue
            }
        )
    }
    var body: some View {
        HStack(spacing: 5) {
            ForEach(0..<5) { i in
                Image.magicStar
                    .renderingMode(.template)
                    .foregroundStyle(i < rating ? tintColor : otherColor)
                    .overlay {
                        if i >= rating {
                            Image.magicStar
                                .renderingMode(.template)
                                .scaleEffect(0.8)
                                .foregroundStyle(.background)
                        }
                    }
                    .onTapGesture {
                        rating = i + 1
                    }
            }
        }
    }
}

extension RatingView {
    func withTint(_ color: Color) -> some View {
        var view = self
        view.tintColor = color
        return view
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(value: .constant(3))
}
