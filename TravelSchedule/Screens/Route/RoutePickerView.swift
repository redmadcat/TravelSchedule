//
//  RoutePickerView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RoutePickerView: View {
    @State var context: RoutePickerViewModel
    let prompt: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            TextField("", text: $context.text, prompt: Text(LocalizedStringKey(prompt)))
                .font(.system(size: 17, weight: .regular))
                .disabled(true)
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: 48)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    RoutePickerView(context: RoutePickerViewModel(), prompt: "From", action: {})
}
