//
//  CarrierFilterView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierFilterView: View {
    @Environment(\.dismiss) private var dismiss
    @State var filter: CarrierFilter
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    CarrierFilterDepartureView(filter: filter)
                    CarrierFilterTransferView(filter: filter)                
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                
                Spacer()
                
                CarrierFilterButtonApplyView(filter: filter)
            }
            .padding(.horizontal, 16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.ypBlackAD)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CarrierFilterView(filter: CarrierFilter())
}
