//
//  SettlementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

struct SettlementView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text(verbatim: "RouteList")
        }
        .navigationTitle("SettlementSelection")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                }
            }
        }
    }
}

#Preview {
    SettlementView()
}
