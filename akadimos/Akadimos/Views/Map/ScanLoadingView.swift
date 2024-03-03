//
//  ScanLoadingView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 03/03/2024.
//

import SwiftUI

struct ScanLoadingView: View {
    @Binding var isPresented: Bool
    var displayTimeInSeconds: TimeInterval = 2.0
    var onFinish: () -> Void
    var body: some View {
        VStack(spacing: 20) {
            
            ProgressView("Please wait...")
                .controlSize(.extraLarge)
                .font(.title2)
            
            Text("Scanning the vicinity")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + displayTimeInSeconds) {
                isPresented = false
                onFinish()
            }
        }
    }
}

#Preview {
    ScanLoadingView(isPresented: .constant(true), onFinish: {})
}
