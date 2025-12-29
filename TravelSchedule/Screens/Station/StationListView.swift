//
//  StationListView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

struct StationListView: View {
    var stations: [Station]
    var settlement: Settlement
    var picker: RoutePickerViewModel
    
    var body: some View {
        List(stations, id: \.self) { station in
            Button(action: {
                guard let settlementTitle = settlement.title, let stationTitle = station.title else {
                    print("exit before route")
                    return
                }
                
                picker.text = settlementTitle + " (" + stationTitle + ")"
                
                Router.shared.toSchedule(settlement: settlement, station: station)
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
