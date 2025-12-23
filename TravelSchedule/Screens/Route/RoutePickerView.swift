//
//  RoutePickerView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RoutePickerView: View {
    @State var text: String = ""
    let prompt: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            TextField("", text: $text, prompt: Text(LocalizedStringKey(prompt)))
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
    RoutePickerView(prompt: "From", action: {})
}
