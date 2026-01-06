//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

import SwiftUI

struct ErrorView: View {
    let text: String
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image(text)
                    .resizable()
                    .frame(width: 223, height: 223)
                    .scaledToFit()
                Text(LocalizedStringKey(text))
                    .foregroundColor(.ypBlackAD)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 10)
                Spacer()
            }            
        }
        .backgroundStyle(.ypWhiteAD)
    }
}

#Preview {
    ErrorView(text: "NoInternet")
}
