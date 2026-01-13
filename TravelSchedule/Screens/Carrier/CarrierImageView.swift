//
//  CarrierImageView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierImageView: View {
    let segment: Segment
    
    var body: some View {
        if let logo = segment.thread?.carrier?.logo,
           let url = URL(string: logo) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                CarrierPlaceholderView()
            }
        } else {
            CarrierPlaceholderView()
        }
    }
}

#Preview {
    CarrierImageView(segment: Segment())
}
