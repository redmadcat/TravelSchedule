//
//  CarrierFilterButtonApplyView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct CarrierFilterButtonApplyView: View {
    @Environment(\.dismiss) private var dismiss
    var filter: CarrierFilter
    
    var body: some View {
        VStack {
            Button {
                filter.set()
                dismiss()
            } label: {
                Text("Apply")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.ypWhite)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .contentShape(Rectangle())
            }
            .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
            .padding(.bottom, 24)
        }
        .opacity(filter.isSet() ? 1 : 0)
    }
}

#Preview {
    CarrierFilterButtonApplyView(filter: CarrierFilter())
}
