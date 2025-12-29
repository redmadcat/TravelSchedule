//
//  StationStubView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

struct StationStubView: View {
    var body: some View {
        Spacer()
        Text("StationNotFound")
            .foregroundColor(.ypBlack)
            .font(.system(size: 24, weight: .bold))
            .padding()
        Spacer()
    }
}

#Preview {
    StationStubView()
}
