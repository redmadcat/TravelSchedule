//
//  CarrierView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

import SwiftUI

struct CarrierView: View {
    @State var context: CarrierViewModel
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack {
                switch context.status {
                case .loading:
                    ProgressLoadingView()
                case .success, .default:
                    VStack {
                        context.segments.isEmpty ?
                            AnyView(SearchStubView(text: "NoOptions")) :
                            AnyView(CarrierListView(segments: context.segments))
                    }
                case .failure(let error):
                    error == .network ? ErrorView(text: "NoInternet") : ErrorView(text: "ServerError")
                }
            }
            .safeAreaInset(edge: .bottom) {
                CarrierFilterButtonView(filter: context.filter)
            }
            .safeAreaInset(edge: .top) {
                CarrierRouteHeaderView(route: context.route)
            }
            .padding(.horizontal, 16)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButtonView(action: {
                    context.filter.isApplied = false
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            if !context.filter.isApplied {
                await context.load()
            }
        }
    }
}

#Preview {
    CarrierBuilder().build(route: Route())
}
