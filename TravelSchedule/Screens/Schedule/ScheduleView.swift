//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State var route: Route
    
    var body: some View {
        VStack {
            StoriesRibbonView()
                .padding(.top, 112)
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
            
            RouteFinderView(route: route)
                .padding(.horizontal, 16)
                .padding(.top, 10)
            
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
        .ignoresSafeArea(edges: .top)
        .onAppear {
            route.validation()
        }
    }
}

#Preview {
    ScheduleView(route: Route())
}
