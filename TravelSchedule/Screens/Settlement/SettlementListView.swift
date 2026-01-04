//
//  SettlementListView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 23.12.2025.
//

import SwiftUI

struct SettlementListView: View {
    var settlements: [Settlement]
    var direction: Route.Direction
    
    var body: some View {
        List(settlements, id: \.self) { settlement in
            Button(action: {
                Router.shared.toStations(settlement: settlement, direction: direction)
            }) {
                SettlementRowView(settlement: settlement)
            }
            .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SettlementListView(settlements: [], direction: Route.Direction())
}
