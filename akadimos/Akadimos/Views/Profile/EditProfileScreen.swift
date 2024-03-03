//
//  EditProfileScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 28/02/2024.
//

import SwiftUI

struct ProfileInfo {
    var firstName = "Drios"
    var lastName = "Man"
    var mobileNumber = "1234567890"
    var email = "abc@gmail.com"
    var address = "Kigali City, Remera"
}

struct EditProfileScreen: View {
    @State private var profile = ProfileInfo()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            Image.notifAndroid
                .resizable()
                .colorInvert()
                .padding()
                .frame(width: 100, height: 100)
                .background(.black, in: .circle)
                .shadow(radius: 3)
                .overlay(alignment: .bottom) {
                    Button(action: {}) {
                        Image.edit
                            .padding(5)
                            .background(.ultraThinMaterial, in: .circle)
                            .foregroundStyle(.white)
                            .padding(10)
                    }
                }
            
            VStack(alignment: .leading) {
                Text("Person Details")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack(spacing: 20){
                    VFieldView("First Name", text: $profile.firstName)
                    VFieldView("Last Name", text: $profile.lastName)
                }
                
                VFieldView("Mobile Number", text: $profile.mobileNumber)
                
                VFieldView("Email Address", text: $profile.email)
                
                VFieldView("Address", text: $profile.address)
            }
            .padding(.horizontal)

        }
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .buttonStyle(.borderedProminent)
                .tint(.gray.opacity(0.3))
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
                .foregroundStyle(.foreground)
                
                Button {
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
                
            }
            .padding(.top, 8)
            .padding(.horizontal)
            .background(.ultraThinMaterial)
        }
        .safeAreaInset(edge: .top) {
            NavBarView("Edit Profile")
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct VFieldView: View {
    let title: LocalizedStringKey
    let placeholder: LocalizedStringKey
    @Binding private var text: String
    init(_ title: LocalizedStringKey, placeholder: LocalizedStringKey = "", text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .fontWeight(.medium)
            TextField(placeholder, text: $text)
                .padding()
                .background(.regularMaterial, in: .rect(cornerRadius: 8))
        }
    }
}

#Preview {
    EditProfileScreen()
}
