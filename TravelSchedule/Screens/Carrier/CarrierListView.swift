//
//  CarrierListView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 09.01.2026.
//

import SwiftUI

struct CarrierListView: View {
    var segments: [Segment]
    
    var body: some View {
        LazyVStack {
            ForEach(segments, id: \.self) { segment in
                if let carrier = segment.thread?.carrier {
                    Button {
                        // carrier info navigation
                    } label: {
                        CarrierRowView(segment: segment)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    CarrierListView(segments: [])
}
