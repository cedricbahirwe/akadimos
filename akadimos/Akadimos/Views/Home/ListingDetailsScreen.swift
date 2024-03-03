//
//  ListingDetailsScreen.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 01/03/2024.
//

import SwiftUI

private enum PageItem: String, CaseIterable {
    case details, reviews
}

struct ListingDetailsScreen: View {
    @State private var selectedTab = PageItem.details
    private let imageHeight: CGFloat = 220
   
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                tourSection
                
                VStack(alignment: .leading) {
                    Group {
                        Text("Parcon Apartment")
                            .font(.title)
                            .fontWeight(.medium)
                        Text("RWF 200,000/month")
                            .font(.title3)
                    }
                    .opacity(0.8)
                    HStack {
                        Image.normalStar
                        Text("3.4")
                    }
                    
                    HStack {
                        AvatarTitlePreview(
                            image: "avatar-1",
                            size: 50,
                            title: "John Snow",
                            subtitle: "Owner"
                        )
                        
                        Image.messageBubble
                    }
                    
                    
                    SegmentView(selection: $selectedTab)
                    
                    if selectedTab == .reviews {
                        ReviewSection()
                    } else {
                        InfoSection()
                    }
                }
                .padding()
                .background(
                    .background,
                    in: .rect(topLeadingRadius: 20, topTrailingRadius: 20)
                )
            }
            .offset(y: -30)
        }
        .scrollIndicators(.hidden)
        .background(backgroundView)
        .safeAreaInset(edge: .bottom) {
            bottomView
                .padding()
                .background(.ultraThinMaterial)
        }
        .safeAreaInset(edge: .top) {
            NavBarView("", trailingItem: {
                bookmarkButton
            })
            .hidesBackground()
            .background(.ultraThinMaterial.blendMode(.softLight))
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var bookmarkButton: some View {
        Button {
            
        } label: {
            ZStack {
                Image.bookmarkFill
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.blue.opacity(0.9))
                
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 12, height: 10)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
            }
            .frame(width: 32, height: 35)
            
        }
    }
    
    private var backgroundView: some View {
        VStack {
            Color.clear
                .frame(height: imageHeight)
                .background(
                    Image("list.detail")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea(.all)
                )
            
            Spacer()
        }
        
    }
    
    private var tourSection: some View {
        VStack {
            Spacer()
            HStack {
                Text("2kms away")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .minimumScaleFactor(0.9)
                    .lineLimit(1)
                    .blendMode(.difference)
                
                Button(action: {}) {
                    Text("Virtual Tour")
                        .fontWeight(.bold)
                        .padding(.vertical, 13)
                        .padding(.horizontal)
                        .background(Color.accentColor.opacity(0.55), in: .rect(cornerRadius: 12))
                }
                
            }
            .foregroundStyle(.white)
            .padding()
        }
        .frame(height: imageHeight)
    }
    
    private var bottomView: some View {
        HStack(spacing: 20) {
            Button {
                
            } label: {
                Label("Map View", systemImage: "map")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
            }
            .buttonStyle(.bordered)
            .tint(.primary)
            
            NavigationLink {
                RentView()
            } label: {
                Text("Rent")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color.accentColor, in: .rect(cornerRadius: 12))
                    .foregroundColor(.white)
            }
        }
    }
}


private extension ListingDetailsScreen {
    struct SegmentView: View {
        @Binding var selection: PageItem
        @Namespace private var animation
        
        var body: some View {
            HStack {
                ForEach(PageItem.allCases, id: \.self) { item in
                    Text(item.rawValue.capitalized)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            selection == item ? Color.accentColor : Color.primary.opacity(0.8)
                        )
                        .scaleEffect(selection == item ? 1 : 0.9)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                selection = item
                            }
                        }
                    
                        .overlay(alignment: .bottom) {
                            if selection == item {
                                Capsule()
                                    .fill(Color.accentColor)
                                    .frame(width: 50, height: 5)
                                    .matchedGeometryEffect(id: "active", in: animation)
                                
                            } else {
                                Color.clear
                                    .frame(height: 5)
                                    .matchedGeometryEffect(id: item, in: animation)
                            }
                        }
                }
                
            }
        }
    }
    
    struct ReviewSection: View {
        var body: some View {
            VStack(alignment: .leading) {
                AvatarTitlePreview(image: "avatar-2",
                                   size: 50,
                                   title: "Kimmy Dora",
                                   subtitle: "June 2, 2023")
                RatingView(value: .constant(4))
                    .withTint(.yellow)
                
                Text("The location is near Auca University")
                    .opacity(0.8)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.regularMaterial, in: .rect(cornerRadius: 12))
        }
    }
    
    struct InfoSection: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    Text("Address").fontWeight(.medium)
                    Text("Kigali, Remera, Parcon Street, Oriental Mindoro")
                        .foregroundStyle(.secondary)
                    
                    Text("Description")
                        .fontWeight(.medium)
                    
                    Text("We have 3 rooms available")
                        .foregroundStyle(.secondary)
                }
                .scrollTransition { effect, phase in
                    effect.opacity(phase.isIdentity ? 1: 0.1)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Gallery")
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Button("See more") {
                            
                        }
                        .font(.callout)
                    }
                    
                    HStack {
                        ForEach(1...3, id: \.self) { i in
                            Image("search-\(i)")
                                .resizable()
                                .frame(maxWidth: .infinity, idealHeight: 75)
                        }
                        .scrollTransition { effect, phase in
                            effect.opacity(phase.isIdentity ? 1: 0.1)
                        }
                        
                    }
                }
                
                Section {
                    
                    Group {
                        Label("Wi-Fi (Additional Charges)", systemImage: "checkmark.circle")
                        Label("Laundry Facilities", systemImage: "checkmark.circle")
                        Label("Study Areas", systemImage: "checkmark.circle")
                        Label("Bicycle Storage", systemImage: "checkmark.circle")
                        Label("Shared Kitchen", systemImage: "checkmark.circle")
                    }
                    .imageScale(.small)
                    .scrollTransition { effect, phase in
                        effect.scaleEffect(phase.isIdentity ? 1: 0.6)
                    }
                } header: {
                    Text("Other details")
                        .fontWeight(.medium)
                    
                }
            }
            .font(.title2)
        }
    }
}

#Preview {
    NavigationStack {
        ListingDetailsScreen()
    }
}
