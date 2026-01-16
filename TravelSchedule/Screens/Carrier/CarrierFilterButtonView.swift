//
//  CarrierFilterButtonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct CarrierFilterButtonView: View {
    var filter: CarrierFilter
    
    var body: some View {
        Button {
            Router.shared.toFilter(filter: filter)
        } label: {
            HStack {
                Text("SpecifyTime")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.ypWhite)
                Circle().frame(width: 8, height: 8, alignment: .leading)
                    .padding(.top, 3)
                    .foregroundColor(filter.isApplied ? .ypRed : .clear)
            }
            .frame(maxWidth: .infinity, minHeight: 60)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
        .padding(.bottom, 24)
    }
}

#Preview {
    CarrierFilterButtonView(filter: CarrierFilter())
}
