//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var route = Route()
    
    var body: some View {
        VStack {
            StoriesRibbonView()
                .padding(.init(top: 24, leading: 0, bottom: 24, trailing: 0))
            
            RouteFinderView(route: route)
                .padding(.horizontal, 16)
                .padding(.top, 20)
            
            Button {
                Router.shared.toCarrier(route: route)
            }
            label: {
                Text("Find")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.ypWhite)
                    .frame(width: 150, height: 60)
            }
            .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
            .padding(.top, 20)
            .opacity(route.isValid ? 1 : 0)
            
            Spacer()
            Divider()
                .overlay(.ypGrayAD)
                .frame(minHeight: 1)
        }
        .background(.ypWhiteAD)
        .onAppear {
            route.validation()
        }
    }
}

#Preview {
    ScheduleView()
}
