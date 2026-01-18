//
//  CarrierContactsInfoView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 18.01.2026.
//

import SwiftUI

struct CarrierContactsInfoView: View {
    let type: String
    let contact: String
    let url: URL
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(LocalizedStringKey(type))
                .font(.system(size: 17, weight: .regular))
            
            Link(destination: url) {
                Text(contact)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.ypBlue)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    CarrierContactsInfoView(type: .empty, contact: .empty, url: URL(string: .empty)!)
}
