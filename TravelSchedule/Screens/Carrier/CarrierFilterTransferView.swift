//
//  CarrierFilterTransferView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct CarrierFilterTransferView: View {
    var filter: CarrierFilter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("ShowWithTransfers")
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24, weight: .bold))
            VStack(spacing: 0) {
                ForEach(Transfer.allCases) { transfer in
                    Button {
                        filter.toggle(transfer)
                    } label: {
                        HStack {
                            Text(NSLocalizedString(transfer.rawValue, comment: .empty))
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Image(systemName: filter.toggled(transfer) ? "largecircle.fill.circle" : "circle")
                                .font(.system(size: 20))
                        }
                        .frame(height: 60)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    CarrierFilterTransferView(filter: CarrierFilter())
}
