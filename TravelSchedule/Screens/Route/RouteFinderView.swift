//
//  RouteFinderView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RouteFinderView: View {
    @State var context: ScheduleViewModel
                
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ypBlue)
                .frame(height: 128)
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 16) {
                VStack(spacing: 0) {
                    RoutePickerView(prompt: "From", action: {
                        context.toSettlements()
                    })
                
                    RoutePickerView(prompt: "To", action: {
                        context.toSettlements()
                    })
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ypWhiteAD)
                )
                
                Button {
                    
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
            }
            .padding(.leading, 18)
        }
    }
}

#Preview {
    RouteFinderView(context: ScheduleViewModel(router: Router.shared))
}
