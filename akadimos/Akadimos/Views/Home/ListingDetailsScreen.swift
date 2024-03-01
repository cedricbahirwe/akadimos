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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
//                topView
                
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
//                       
                        
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
                    
                    
                    
                    Spacer()
                }
                .padding()
                .background(.background)

                //            Rectangle()
                //                 .background(
                //                     .regularMaterial,
                //                     ignoresSafeAreaEdges: .bottom)
            }
        }
        .safeAreaInset(edge: .bottom) {
            bottomView
                .padding()
                .background(.ultraThinMaterial)
        }
       
    }
    
    private var topView: some View {
        ZStack(alignment: .top) {
            Image("list.detail")
                .resizable()
                .frame(maxWidth: .infinity)
//                        .ignoresSafeArea()
                .ignoresSafeArea(.container)
//
            VStack {
                NavBarView("", trailingItem: {
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
                    
                })
                .hidesBackground()
                
                Spacer()
                HStack {
                    Text("2kms away")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .minimumScaleFactor(0.9)
                        .lineLimit(1)
                    
                    Button(action: {}) {
                        Text("Virtual Tour")
                            .fontWeight(.bold)
                            .padding(.vertical, 13)
                            .padding(.horizontal)
                            .background(.blue.opacity(0.55), in: .rect(cornerRadius: 12))
                    }
                    
                }
                .foregroundStyle(.white)
                .padding()
            }
            
        }
        .frame(height: 300)
        .background(.red, ignoresSafeAreaEdges: .all)
        .ignoresSafeArea()
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
            
            Button {
                
            } label: {
                Text("Rent")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
            }
            .buttonStyle(.borderedProminent)

        }
    }
}


private struct SegmentView: View {
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
                                .fill(Color.blue)
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

#Preview {
    ListingDetailsScreen()
}
