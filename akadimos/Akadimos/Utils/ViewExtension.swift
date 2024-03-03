//
//  ViewExtension.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

extension View {
    func inspectSize() -> some View {
        overlay {
            GeometryReader { geo in
                let size = geo.frame(in: .global).size
                return Text("W\(size.width), H:\(size.height)")
            }
        }
    }
}


//struct PresentationChangeModifier<T>: ViewModifier {
//    @AppStorage(InStorageKeys.isTabVisible) private var isTabVisible = true
//    @Environment(\.isPresented) private var isPresented
//
//    let item: T
//    func body(content: Content) -> some View {
//        content
//        .onChange(of: isPresented, initial: true) { old, new   in
//            print("Old:", old, "New:", new)
//            if (old && new) {
//                isTabVisible = false
//            } else if old && !new {
//                isTabVisible = true
//            }
//        }
//    }
//    
//}
//
//
//extension View {
//    func hidesTabOnPresentation() -> some View {
//        modifier(PresentationChangeModifier(item: self))
//    }
//}
