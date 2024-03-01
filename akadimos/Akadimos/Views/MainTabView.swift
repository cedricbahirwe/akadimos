//
//  MainTabView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

struct MainTabView<Content> : View where Content : View {
    @Binding var selection: TabItem
    @AppStorage(InStorageKeys.isTabVisible) private var isTabVisible = true
    var contentView: () -> Content
    var body: some View {
        ZStack(alignment: .bottom) {
            
            contentView()
                .frame(maxHeight: .infinity)
                .padding(.bottom, isTabVisible ? 70 : 0 )
            
            TabBarView(selection: $selection)
                .background(.primaryBackground)
                .opacity(isTabVisible ? 1 : 0)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MainTabView(selection: .constant(.home)) {
        HomeScreen()
    }
}
