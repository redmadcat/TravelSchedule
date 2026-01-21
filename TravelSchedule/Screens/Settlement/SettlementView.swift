//
//  SettlementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

struct SettlementView: View {
    @State var context: SettlementViewModel
    
    var body: some View {
        VStack {
            switch context.status {
            case .loading:
                ProgressLoadingView()
            case .success, .default:
                VStack {
                    context.settlements.isEmpty ?
                        AnyView(SearchStubView(text: "SettlementNotFound")) :
                        AnyView(SettlementListView(settlements: context.settlements, direction: context.direction))
                }
                .safeAreaInset(edge: .top) {
                    SearchView(request: $context.request)
                        .background(.ypWhiteAD)
                }
            case .failure(let error):
                error == .network ? ErrorView(text: "NoInternet") : ErrorView(text: "ServerError")
            }
        }
        .navigationTitle("SettlementSelection")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButtonView()
            }
        }
        .background(.ypWhiteAD)
        .task {
            await context.load()
        }
    }
}

#Preview {
    SettlementBuilder().build(direction: Route.Direction())
}
