//
//  CarrierFilterView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierFilterView: View {
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
                    NavigationBackButtonView()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CarrierFilterView(filter: CarrierFilter())
}
