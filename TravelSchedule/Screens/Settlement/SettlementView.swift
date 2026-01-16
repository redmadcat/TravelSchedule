//
//  SettlementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

struct SettlementView: View {
    @State var context: SettlementViewModel
    @State private var request: String = ""
    var direction: Route.Direction
    
    private var settlements: [Settlement] {
        request.isEmpty ?
            context.settlements :
            context.settlements.filter {
                guard let title = $0.title else { return false }
                return title.localizedCaseInsensitiveContains(request)
            }
    }
    
    var body: some View {
        VStack {
            switch context.status {
            case .loading:
                ProgressLoadingView()
            case .success, .default:
                VStack {
                    settlements.isEmpty ?
                        AnyView(SearchStubView(text: "SettlementNotFound")) :
                        AnyView(SettlementListView(settlements: settlements, direction: direction))
                }
                .safeAreaInset(edge: .top) {
                    SearchView(request: $request)
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
