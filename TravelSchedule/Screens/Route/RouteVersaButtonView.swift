//
//  RouteVersaButtonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct RouteVersaButtonView: View {
    var route: Route
    
    var body: some View {
        Button {
            route.versa()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(.ypWhite)
                    .frame(width: 36, height: 36)
                
                Image(systemName: "arrow.2.squarepath")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 16)
                    .foregroundStyle(.ypBlue)
            }
        }
        .padding(.trailing, 16)
        .opacity(route.isValid ? 1 : 0.5)
    }
}

#Preview {
    RouteVersaButtonView(route: Route())
}
