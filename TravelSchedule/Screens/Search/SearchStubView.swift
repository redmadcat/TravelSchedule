//
//  SearchStubView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

import SwiftUI

struct SearchStubView: View {
    let text: String
    
    var body: some View {
        Spacer()
        Text(LocalizedStringKey(text))
            .foregroundColor(.ypBlackAD)
            .font(.system(size: 24, weight: .bold))
            .padding()
        Spacer()
    }
}

#Preview {
    SearchStubView(text: "StationNotFound")
}
