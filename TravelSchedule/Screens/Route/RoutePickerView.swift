//
//  RoutePickerView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct RoutePickerView: View {
    @State var route: Route.Direction
    let prompt: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {            
            TextField("", text: $route.text, prompt: Text(LocalizedStringKey(prompt)).foregroundColor(.ypGray))
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlack)
                .disabled(true)
                .lineLimit(1)
                .frame(maxWidth: .infinity, minHeight: 48)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    RoutePickerView(route: Route.Direction(), prompt: "From", action: {})
}
