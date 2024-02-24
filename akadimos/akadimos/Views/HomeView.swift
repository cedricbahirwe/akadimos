//
//  HomeView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var navigationPath: [Route]

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

        }
        .toolbar(.hidden, for: .navigationBar)

    }
}

#Preview {
    HomeView(navigationPath: .constant([]))
}
