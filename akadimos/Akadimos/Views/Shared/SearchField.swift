//
//  SearchField.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

struct SearchField: View {
    private var placeholder: LocalizedStringKey
    @Binding private var text: String
    
    private var accessoryConfig: SearchField.Configuration?
    
    init(_ placeholder: LocalizedStringKey,
         text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
            if let config = accessoryConfig {
                config.image
                    .onTapGesture(perform: config.action)
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(
            .background,
            in: .rect(cornerRadius: 12)
        )
    }
    
    struct Configuration {
        var image: Image
        var action: () -> Void
        
        init(_ image: Image, action: @escaping () -> Void) {
            self.image = image
            self.action = action
        }
    }
}

extension SearchField {
    func accessoryConfig(_ config: SearchField.Configuration) -> SearchField {
        var view = self
        view.accessoryConfig = config
        return view
    }
    
    func accessoryAction(_ image: Image, action: @escaping () -> Void) -> SearchField {
        var view = self
        view.accessoryConfig = .init(image, action: action)
        return view
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchField("", text: .constant(""))
}
