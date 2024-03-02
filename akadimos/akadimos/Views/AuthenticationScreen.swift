//
//  AuthenticationScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 25/02/2024.
//

import SwiftUI

private enum AuthFlow {
    case login
    case signup
}

private struct LoginModel {
    var username = ""
    var password = ""
}

struct SignupModel {
    var username = ""
    var email = ""
    var password = ""
    var confirmPass = ""
    var agreeToTerms = false
}
struct AuthenticationScreen: View {
    @State private var authFlow: AuthFlow = .login
    @State private var login = LoginModel()
    @State private var signup = SignupModel()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    private var isLogin: Bool { authFlow == .login }
    var body: some View {
        VStack {
            
            Image.loginDoor
                .resizable()
                .scaledToFit()
            
            Text(isLogin ? "Login" : "Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            
            VStack(spacing: 26) {
                if isLogin {
                    loginFields
                } else {
                    signupFields
                }
                
                if !isLogin {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: signup.agreeToTerms ? "checkmark.square.fill" : "square")
                            .imageScale(.large)
                            .foregroundStyle(Color.accentColor)
                            .onTapGesture {
                                signup.agreeToTerms.toggle()
                            }
                        
                        Group {
                            Text("By registering, you are agreeing with our ")
                            + Text("[Terms of Use](https://cedricbahirwe.github.io/)").underline()
                            + Text(" and ")
                            + Text("[Privacy Policy](https://cedricbahirwe.github.io/)")
                                .underline()
                            
                        }
                        .fontWeight(.light)
                        
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
                
                HStack {
                    
                    if isLogin {
                        Button("Forgot Password ?") {}
                            .foregroundStyle(.primary)
                            .opacity(0.6)
//                            .transition(RotatingFadeTransition())
                    }
                    
                    Spacer()
                    
                    
                    if isLogin {
                        Button("Create Account?") {
                            withAnimation {
                                authFlow = .signup
                            }
                        }
                    } else {
                        Button("Already have an account?") {
                            withAnimation {
                                authFlow = .login
                            }
                        }
                    }
                }
                .bold()
                
                Button {
                    isLoggedIn = true
                } label: {
                    Text(isLogin ? "Login" : "Register")
                        .font(.title2.weight(.bold))
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.accentColor,
                            in: .rect(cornerRadius: 10))
                        .foregroundStyle(.white)
                }
                
            }
            .padding(.bottom, 25)
            
            if isLogin {
                bottomLoginView
            }
            
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .toolbar(.hidden, for: .navigationBar)
    }
}

private extension AuthenticationScreen {
    @ViewBuilder
    var loginFields: some View {
        TextField("driosman", text: $login.username)
            .padding()
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.init(red: 136/255, green: 126/255, blue: 126/255))
            }
            .font(.callout)
        
        SecureField("Password", text: $login.password)
            .padding()
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color(red: 136/255, green: 126/255, blue: 126/255))
            }
            .font(.callout)
        
    }
    
    @ViewBuilder
    var signupFields: some View {
        Group {
            HStack(spacing: 15) {
                Image("field-name")
                
                TextField("Username", text: $signup.username)
            }
            .padding(.horizontal)
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.init(red: 41/255, green: 45/255, blue: 50/255), lineWidth: 2)
            }
            
            HStack(spacing: 15) {
                Image("field-email")
                
                TextField("Email Address", text: $signup.email)
            }
            .padding(.horizontal)
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.init(red: 41/255, green: 45/255, blue: 50/255), lineWidth: 2)
            }
            
            HStack(spacing: 15) {
                Image("field-password")
                
                SecureField("Password", text: $signup.password)
            }
            .padding(.horizontal)
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.init(red: 41/255, green: 45/255, blue: 50/255), lineWidth: 2)
            }
            
            HStack(spacing: 15) {
                Image("field-password")
                
                SecureField("Confirm Password", text: $signup.confirmPass)
            }
            .padding(.horizontal)
            .frame(height: 50)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.init(red: 41/255, green: 45/255, blue: 50/255), lineWidth: 2)
            }
        }
        .font(.callout)
    }
    var bottomLoginView: some View {
        VStack {
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
    }
}

#Preview {
    AuthenticationScreen()
}
