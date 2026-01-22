//
//  CarrierRowView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 12.01.2026.
//

import SwiftUI

struct CarrierRowView: View {
    let segment: Segment
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    HStack {
                        CarrierImageView(segment: segment)
                        CarrierDetailsView(segment: segment)
                    }
                    
                    Spacer()
                    
                    Text(segment.departureDay)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.ypBlack)
                }
                
                Spacer()
                
                CarrierScheduleView(segment: segment)
            }
            .padding(14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 104)
        .background(RoundedRectangle(cornerRadius: 24).fill(.ypLightGray))
    }
}

#Preview {
    CarrierRowView(segment: Segment())
}
