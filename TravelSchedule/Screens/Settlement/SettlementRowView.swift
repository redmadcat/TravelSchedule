//
//  SettlementRowView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

struct SettlementRowView: View {
    let settlement: String
    
    var body: some View {
        HStack {
            Text(settlement)
                .foregroundColor(.ypBlack)
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.ypBlack)
        }
    }
}
