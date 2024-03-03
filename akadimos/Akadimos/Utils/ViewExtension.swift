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
