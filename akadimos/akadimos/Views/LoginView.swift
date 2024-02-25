//
//  LoginView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var navigationPath: [Route]
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            
            Image.loginDoor
                .resizable()
                .scaledToFit()
                
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.foregroundLoginBlue)
                .padding(.bottom, 40)
            
            VStack(spacing: 26) {
                TextField("driosman", text: $username)
                    .padding()
                    .frame(height: 50)
                    .overlay(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.init(red: 136/255, green: 126/255, blue: 126/255))
                    }
                    .font(.callout)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(height: 50)
                    .overlay(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color(red: 136/255, green: 126/255, blue: 126/255))
                    }
                    .font(.callout)
                
                HStack {
                    
                    Button("Forgot Password ?") {}
                        .foregroundStyle(.primary)
                        .opacity(0.6)
                    
                    Spacer()
                    Button("Create Account?") {
                        
                    }
                }
                .bold()
                
                Button {
                    navigationPath.append(.home)
                } label: {
                    Text("Login")
                        .font(.title2.weight(.bold))
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.accentColor,
                            in: .rect(cornerRadius: 5))
                        .foregroundStyle(.white)
                }
                
            }
            .padding(.bottom, 25)
            
            Text("Or Sign up with")
                .opacity(0.8)
                .font(.callout)
            
            HStack(spacing: 20) {
                Button(action: {}) {
                    Image("google-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .padding()
                        .background(.ultraThickMaterial)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                            
                                .strokeBorder(.linearGradient(colors: [.red, .purple], startPoint: .top, endPoint: .bottom))
                        }
                }
                
                Button(action: {}) {
                    Image("facebook-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .padding()
                        .background(.ultraThickMaterial)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                            
                                .strokeBorder(.linearGradient(colors: [.red, .purple], startPoint: .top, endPoint: .bottom))
                        }
                }
                
                Button(action: {}) {
                    Image(systemName: "apple.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .padding()
                        .background(.ultraThickMaterial)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                            
                                .strokeBorder(.linearGradient(colors: [.red, .purple], startPoint: .top, endPoint: .bottom))
                        }
                        .foregroundStyle(.foreground)
                }
            }
            .padding(.vertical, 10)
            
            
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    LoginView(navigationPath: .constant([]))
//            .preferredColorScheme(.dark)
}
