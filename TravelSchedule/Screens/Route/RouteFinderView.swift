//
//  RouteFinderView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RouteFinderView: View {
    @State var route: Route
                
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ypBlue)
                .frame(height: 128)
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 16) {
                VStack(spacing: 0) {
                    RoutePickerView(route: route.from, prompt: "From", action: {
                        Router.shared.toSettlements(direction: route.from)
                    })
                
                    RoutePickerView(route: route.to, prompt: "To", action: {
                        Router.shared.toSettlements(direction: route.to)
                    })
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ypWhiteAD)
                )
                
                Button {
                    route.versa()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.ypWhiteAD)
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
            .padding(.leading, 18)
            .onAppear {
                route.validation()
            }
        }
    }
}

#Preview {
    RouteFinderView(route: Route())
}
