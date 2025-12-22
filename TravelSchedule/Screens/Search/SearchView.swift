//
//  SearchView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

struct SearchView: View {
    @Binding var request: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 22)
                .padding(.leading, 8)
                .foregroundColor(request.isEmpty ? .ypGray : .ypBlack)
            
            TextField(
                "",
                text: $request,
                prompt: Text("EnterRequest")
                    .foregroundStyle(.ypGray)
            )
            .autocorrectionDisabled()
            .foregroundStyle(.ypBlack)
            
            if !request.isEmpty {
                Button(action: {
                    request = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                        .padding(.trailing, 8)
                        .foregroundColor(.ypGray)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 36)
        .background(.ypLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}
