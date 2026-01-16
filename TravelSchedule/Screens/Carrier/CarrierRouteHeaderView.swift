//
//  CarrierRouteHeaderView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct CarrierRouteHeaderView: View {
    let route: Route
    
    var body: some View {
        VStack {
            Text(route.description())
                .padding(.top, 10)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlackAD)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.ypWhiteAD)
    }
}

#Preview {
    CarrierRouteHeaderView(route: Route())
}
