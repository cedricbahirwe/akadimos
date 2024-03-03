//
//  RentView.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 03/03/2024.
//

import SwiftUI

private enum PaymentMethod: String, CaseIterable {
    case cash = "In-Person"
    case momo = "Mobile Money"
}
struct RentView: View {
    @State private var profile = ProfileInfo()
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedDate = Date(timeIntervalSinceNow: 86_400)
    @State private var selectPayment: PaymentMethod?

    var body: some View {
        ScrollView {
//            VStack(alignment: .leading) {
//                Text("Person Details")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                
//                HStack(spacing: 20){
//                    VFieldView("First Name", text: $profile.firstName)
//                    VFieldView("Last Name", text: $profile.lastName)
//                }
//                
//                VFieldView("Mobile Number", text: $profile.mobileNumber)
//                
//                VFieldView("Email Address", text: $profile.email)
//                
//            }
//            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Rental Details")
                    .font(.title2)
                    .fontWeight(.bold)
                
          
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Start Date")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .fixedSize()
                    .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Payment Method")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    HStack(spacing: 15) {
                        ForEach(PaymentMethod.allCases, id: \.self) { item in
                            let color = selectPayment == item ? Color.accentColor : Color.primary
                            Label {
                                Text(item.rawValue)
                            } icon: {
                                if selectPayment == item {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                }
                            }
                            .fontWeight(.semibold)
                            .foregroundStyle(color)
                            .padding(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(color)
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectPayment = item
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .background(alignment: .top) {
            Image.rentBackground
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
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
                    Text("Rent")
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
                .hidesBackground()
                .background(.ultraThinMaterial.opacity(0.4))
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    RentView()
}
