//
//  SettlementRowView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

struct SettlementRowView: View {
    let settlement: Settlement
    
    var body: some View {
        HStack {
            Text(verbatim: settlement.title ?? "")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlackAD)
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.ypBlackAD)
        }
        .frame(height: 60)
    }
}

#Preview {
    SettlementRowView(settlement: Settlement(title: "Пятигорск", stations: [Station(title: "Лермонтовский вокзал")]))
}
