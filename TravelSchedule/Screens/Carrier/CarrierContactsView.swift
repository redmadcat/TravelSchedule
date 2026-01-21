//
//  CarrierContactsView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierContactsView: View {
    let carrier: Carrier
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                                   .fill(Color.ypLightGray)
                    
                    if let logo = carrier.logo,
                       let url = URL(string: logo) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 104)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        } placeholder: {
                            CarrierPlaceholderView(width: 104, height: 104)
                        }
                    } else {
                        CarrierPlaceholderView(width: 104, height: 104)
                    }
                }
                .frame(height: 104)
                .padding(.top, 10)
                                
                Text(carrier.title ?? .dash)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                         
                CarrierContactsInfoView(type: "Email", contact: carrier.email ?? .dash,
                                        url: URL(string: "mailto:\(String(describing: carrier.email))")!)
                
                CarrierContactsInfoView(type: "PhoneNumber", contact: carrier.phone ?? .dash,
                                        url: URL(string: "tel:\(String(describing: carrier.phone))")!)
                                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("CarrierInfo")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButtonView()
            }
        }
    }
}

#Preview {
    CarrierContactsView(carrier: Carrier())
}
