//
//  StationListView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

struct StationListView: View {
    var direction: Route.Direction
    var stations: [Station]
    var settlement: Settlement
    
    var body: some View {
        List(stations, id: \.self) { station in
            Button(action: {
                direction.setRoute(settlement: settlement, station: station)
                Router.shared.toRoot()
            }) {
                StationRowView(station: station)
            }
            .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
            .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    StationListView(stations: [], settlement: Settlement(title: "Пятигорск", stations: [Station(title: "Лермонтовский вокзал")]))
//}
