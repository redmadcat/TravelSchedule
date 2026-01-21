//
//  StationView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

struct StationView: View {
    @State var context: StationViewModel
        
    var body: some View {
        VStack {
            context.stations.isEmpty ?
                AnyView(SearchStubView(text: "StationNotFound")) :
                AnyView(StationListView(direction: context.direction, stations: context.stations, settlement: context.settlement))
        }
        .navigationTitle("StationSelection")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButtonView()
            }
        }
        .safeAreaInset(edge: .top) {
            SearchView(request: $context.request)
                .background(.ypWhiteAD)
        }
        .background(.ypWhiteAD)
    }
}

#Preview {
    StationView(context: StationViewModel(settlement: Settlement(title: "Пятигорск", stations: [Station(title: "Лермонтовский вокзал")]), direction: Route.Direction()))
}
