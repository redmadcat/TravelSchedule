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
    @State var filter: CarrierFilter
    let route: Route
    private var segments: [Segment] {
        filter.isApplied ?
        context.segments.filter { filter.apply($0) } :
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
            .safeAreaInset(edge: .bottom) {
                Button {
                    Router.shared.toFilter(filter: filter)
                } label: {
                    HStack {
                        Text("SpecifyTime")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(.ypWhite)
                        Circle().frame(width: 10, height: 10, alignment: .leading)
                            .padding(.top, 3)
                            .foregroundColor(filter.isApplied ? .ypRed : .clear)
                    }
                    .frame(maxWidth: .infinity, minHeight: 60)
                }
                .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
                .padding(.bottom, 24)
            }
            .safeAreaInset(edge: .top) {
                VStack {
                    Text(route.description())
                        .padding(.top, 10)
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
                    filter.isApplied = false
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlackAD)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            if !filter.isApplied {
                await context.load(route: route)
            }
        }
    }
}

#Preview {
    CarrierBuilder().build(route: Route())
}
