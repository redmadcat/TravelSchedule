//
//  CarrierPlaceholderView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierPlaceholderView: View {
    var body: some View {
        Image(systemName: "train.side.front.car")
            .resizable()
            .padding(.all, 3)
            .scaledToFit()
            .foregroundStyle(.ypGray)
            .frame(width: 38, height: 38)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.ypGray.opacity(0.2))
            )
    }
}

#Preview {
    CarrierPlaceholderView()
}
