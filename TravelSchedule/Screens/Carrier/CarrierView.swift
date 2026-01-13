//
//  CarrierView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

import SwiftUI

struct CarrierView: View {
    @Environment(\.dismiss) private var dismiss
    @State var context: CarrierViewModel
    let route: Route
    private var segments: [Segment] {
        context.segments
    }
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack {
                switch context.status {
                case .loading:
                    ProgressLoadingView()
                case .success, .default:
                    VStack {
                        segments.isEmpty ?
                            AnyView(SearchStubView(text: "NoOptions")) :
                            AnyView(CarrierListView(segments: segments))
                    }
                case .failure(let error):
                    error == .network ? ErrorView(text: "NoInternet") : ErrorView(text: "ServerError")
                }
            }
            .safeAreaInset(edge: .top) {
                VStack {
                    Text(route.description())
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.ypBlackAD)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(.ypWhiteAD)
            }
            .padding(.horizontal, 16)
        }
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
        .navigationBarBackButtonHidden(true)
        .task {
            await context.load(route: route)
        }
    }
}

#Preview {
    CarrierBuilder().build(route: Route())
}
