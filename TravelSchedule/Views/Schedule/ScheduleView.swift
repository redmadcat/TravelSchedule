//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack {
            RouteFinderView()
                .padding(.horizontal, 16)
                .padding(.top, 20)
            
            Spacer()
        }
        .padding(.vertical, 68)
        .background(.ypWhite)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ScheduleView()
}
