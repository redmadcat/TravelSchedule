//
//  RoutePickerView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RoutePickerView: View {
    let direction: String
    let isValid: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(direction)
                .foregroundStyle(isValid ? .ypBlack : .ypGray)
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
        }
    }
}
