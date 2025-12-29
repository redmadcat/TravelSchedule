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
    @State var context: StationViewModel
    let settlement: Settlement
    
    private var stations: [Station] {
        request.isEmpty ?
            settlement.stations ?? [] :
            settlement.stations?.filter { $0.title!.localizedCaseInsensitiveContains(request) } ?? []
    }
    
    var body: some View {
        VStack {
            stations.isEmpty ?
                AnyView(StationStubView()) :
                AnyView(StationListView(stations: stations, settlement: settlement, picker: context.picker))
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
                        .foregroundColor(.ypBlack)
                }
            }
        }
        .safeAreaInset(edge: .top) {
            SearchView(request: $request)
        }
        .backgroundStyle(.ypWhite)
    }
}

//#Preview {
//    StationView(settlement: nil)
//}
