//
//  CarrierDetailsView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierDetailsView: View {
    let segment: Segment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(segment.thread?.carrier?.title ?? NSLocalizedString("NoName", comment: .empty))
                .lineLimit(1)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
            
            if segment.hasTransfers {
                Text(NSLocalizedString("HasTransfer", comment: .empty))
                    .lineLimit(1)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.ypRed)
            }
        }
    }
}

#Preview {
    CarrierDetailsView(segment: Segment())
}
