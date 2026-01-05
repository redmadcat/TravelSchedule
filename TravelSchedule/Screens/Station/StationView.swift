//
//  StationView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

struct StationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var request: String = ""
    let settlement: Settlement
    var direction: Route.Direction
    
    private var stations: [Station] {
        request.isEmpty ?
            settlement.stations ?? [] :
            settlement.stations?.filter {
                guard let title = $0.title else { return false }
                return title.localizedCaseInsensitiveContains(request)
            } ?? []
    }
    
    var body: some View {
        VStack {
            stations.isEmpty ?
                AnyView(SearchStubView(text: "StationNotFound")) :
                AnyView(StationListView(direction: direction, stations: stations, settlement: settlement))
        }
        .navigationTitle("StationSelection")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
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
        .safeAreaInset(edge: .top) {
            SearchView(request: $request)
        }
        .backgroundStyle(.ypWhite)
    }
}

#Preview {
    StationView(settlement: Settlement(title: "Пятигорск", stations: [Station(title: "Лермонтовский вокзал")]), direction: Route.Direction())
}
