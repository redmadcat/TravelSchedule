//
//  CarrierScheduleView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierScheduleView: View {
    let segment: Segment
    
    var body: some View {
        HStack(spacing: 5) {
            Text(segment.fakeDepartureTime)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlackAD)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.ypGray)
            Text(segment.durationFromFakeDeparture)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlackAD)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.ypGray)
            Text(segment.arrivalText)
        }
    }
}

#Preview {
    CarrierScheduleView(segment: Segment())
}
