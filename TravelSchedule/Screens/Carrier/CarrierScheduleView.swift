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
            Text(segment.departureTime)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.ypGray)
            Text("\(segment.durationHours) hours")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlack)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.ypGray)
            Text(segment.arrivalTime)
                .foregroundStyle(.ypBlack)
        }
    }
}

#Preview {
    CarrierScheduleView(segment: Segment())
}
