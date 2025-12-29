//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State var context: ScheduleViewModel

    var body: some View {
        VStack {
            RouteFinderView(context: context.route)
                .padding(.horizontal, 16)
                .padding(.top, 252)
            
            Button {
                
            } label: {
                Text("Find")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.ypWhiteAD)
                    .frame(width: 150, height: 60)
            }
            .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
            .padding(.top, 20)
            
            Spacer()
            Divider()
        }
        .background(.ypWhite)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ScheduleView(context: ScheduleViewModel(route: RouteFinderViewModel(router: Router.shared), settlement: nil, station: nil))
}
