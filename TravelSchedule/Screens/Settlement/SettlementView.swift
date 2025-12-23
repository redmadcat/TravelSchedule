//
//  SettlementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

struct SettlementView: View {
    @Environment(\.dismiss) private var dismiss
    @State var context: SettlementViewModel
    @State private var request: String = ""
    
    private var filteredResults: [Settlement] {
        request.isEmpty ?
            context.settlements :
            context.settlements.filter { $0.title!.localizedCaseInsensitiveContains(request) }
        /*
         * $0.title! will never be empty here, it is guaranteed by the first context filter.
         */
    }
    
    var body: some View {
        VStack {
            if context.isBusy {
                Spacer()
                ProgressView("Loading")
                Spacer()
            } else {
                if filteredResults.isEmpty {
                    Spacer()
                    Text("SettlementNotFound")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 24, weight: .bold))
                        .padding()
                    Spacer()
                } else {
                    List(filteredResults, id: \.self) { settlement in
                        Button(action: {
                            
                        }) {
                            SettlementRowView(settlement: settlement)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .navigationTitle("SettlementSelection")
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
                .disabled(context.isBusy)
                .opacity(context.isBusy ? 0.5 : 1)
        }
        .backgroundStyle(.ypWhite)
    }
}

#Preview {
    SettlementBuilder().build()
}
