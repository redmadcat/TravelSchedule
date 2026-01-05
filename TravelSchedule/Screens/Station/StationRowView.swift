//
//  StationRowView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

struct StationRowView: View {
    let station: Station
    
    var body: some View {
        HStack {
            Text(verbatim: station.title ?? "")
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
    StationRowView(station: Station())
}
