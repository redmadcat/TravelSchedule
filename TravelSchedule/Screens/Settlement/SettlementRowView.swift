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
                .foregroundColor(.ypBlack)
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.ypBlack)
        }
    }
}
