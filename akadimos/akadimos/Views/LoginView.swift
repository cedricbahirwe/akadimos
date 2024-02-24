//
//  LoginView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 0) {
                    Image("Subtract")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.loginArtwork)
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea()
                        .overlay(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("AkaDimos")
                                    .font(.title2.weight(.bold))
                                    .kerning(1.5)
                                Text("Find Your Next Place")
                                    .font(.caption)
                                    
                            }
                            .foregroundColor(.foregroundLoginBlue)
                            .padding()
                        }
                    
                    
                    Color.loginBgWhite
                        .ignoresSafeArea()
                }
            }
            
            VStack {
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.foregroundLoginBlue)
                    .padding(.bottom, 40)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Email")
                        TextField("email@...", text: .constant("email@gmail.com"))
                            .padding(.vertical, 5)
                            .overlay(alignment: .bottom) {
                                Color.foregroundLoginBlue
                                    .frame(height: 1)
                            }
                        
                    }
                    .font(.callout)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Password")
                        HStack {
                            SecureField("Password", text: .constant(""))
                            Button("Forgot?") {}
                                .foregroundColor(.foregroundLoginBlue)
                            
                        }
                        .padding(.vertical, 5)
                        .overlay(alignment: .bottom) {
                            Color.foregroundLoginBlue
                                .frame(height: 1)
                        }
                        
                    }
                    .font(.callout)
                    
                    Button {
                        
                    } label: {
                        Text("Log In")
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.foregroundLoginBlue, in: .rect(cornerRadius: 5))
                            .foregroundStyle(.background)
                    }
                    
                }
                .padding(.bottom, 25)
                
                Text("Or continue with")
                    .foregroundStyle(.secondary)
                    .font(.callout)

                HStack(spacing: 20) {
                    Button(action: {}) {
                        Text("Google")
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.loginBtnBg, in: .rect(cornerRadius: 8))
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(.secondary,
                                            lineWidth: colorScheme == .dark ? 1 : 0)
                            })
                            .foregroundStyle(.foreground.opacity(0.8))
                    }
                    
                    Button(action: {}) {
                        Label("Apple", systemImage: "apple.logo")
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.loginBtnBg, in: .rect(cornerRadius: 8))
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(.secondary,
                                            lineWidth: colorScheme == .dark ? 1 : 0)
                            })
                            .foregroundStyle(.foreground.opacity(0.8))
                    }
                }
                .padding(.vertical, 10)
                
                
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                        .foregroundStyle(.secondary)
                    Button("Create now") {
                        
                    }
                    .foregroundStyle(.foregroundLoginBlue)
                }
                .font(.callout)
                .padding(.bottom)
                
            }
            .padding(.horizontal, 25)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}
