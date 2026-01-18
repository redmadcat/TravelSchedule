//
//  UserAgreementTextView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 18.01.2026.
//

import SwiftUI

struct UserAgreementTextView: View {
    var content: String
    var font: Font
    var padding = 8.0
    
    var body: some View {
        Text(LocalizedStringKey(content))
            .font(font)
            .padding(.bottom, padding)
    }
}

#Preview {
    UserAgreementTextView(content: .empty, font: .system(size: 24, weight: .bold))
}
