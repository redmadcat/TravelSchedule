//
//  NavigationBackButtonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import SwiftUI

struct NavigationBackButtonView: View {
    @Environment(\.dismiss) private var dismiss
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlackAD)
        }
    }
}

#Preview {
    NavigationBackButtonView()
}
