//
//  ViewExtension.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 26/02/2024.
//

import SwiftUI

extension View {
    func inspectSize(result: @escaping (CGSize) -> Void) -> some View {
        overlay {
            GeometryReader { geo in
                result(geo.frame(in: .global).size)
                return EmptyView()
            }
        }
    }
}
