//
//  CarrierFilterDepartureView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct CarrierFilterDepartureView: View {
    var filter: CarrierFilter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("DepartureTime")
                .padding(.vertical, 10)
                .font(.system(size: 24, weight: .bold))
            VStack(spacing: 0) {
                ForEach(Departure.allCases) { departure in
                    Button {
                        filter.toggle(departure)
                    } label: {
                        HStack {
                            Text(NSLocalizedString(departure.rawValue, comment: .empty))
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Image(systemName: filter.toggled(departure) ? "checkmark.square.fill" : "square")
                                .font(.system(size: 20))
                        }
                        .frame(height: 60)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .foregroundStyle(.ypBlackAD)
    }
}

#Preview {
    CarrierFilterDepartureView(filter: CarrierFilter())
}
