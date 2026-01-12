//
//  CarrierRowView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 12.01.2026.
//

import SwiftUI

struct CarrierRowView: View {
    let segment: Segment
    private let stub = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    HStack {
                        if let logo = segment.thread?.carrier?.logo,
                           let url = URL(string: logo) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 38, height: 38)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            } placeholder: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.ypGray)
                                    .frame(width: 38, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.ypGray.opacity(0.2))
                                    )
                            }
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.ypGray)
                                .frame(width: 38, height: 38)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(segment.thread?.carrier?.title ?? "NoName")
                                .lineLimit(1)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundStyle(.ypBlackAD)
                            
                            // has_transfer text
                        }
                    }
                    
                    Spacer()
                    
                    Text(verbatim: segment.departure?.description ?? "StartDate")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.ypBlackAD)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text(verbatim: segment.departure?.description ?? "DepartureDate")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(.ypBlackAD)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(verbatim: segment.duration?.description ?? "DurationDate")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.ypBlackAD)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(verbatim: segment.arrival?.description ?? "ArrivalDate")
                }
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 104)
        .background(RoundedRectangle(cornerRadius: 20).fill(.ypLightGray))
    }
}

#Preview {
    CarrierRowView(segment: Segment())
}
