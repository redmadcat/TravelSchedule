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
    
    private var settlements: [Settlement] {
        request.isEmpty ?
            context.settlements :
            context.settlements.filter { $0.title!.localizedCaseInsensitiveContains(request) }
        /*
         * $0.title! will never be empty here, it is guaranteed by the first context filter.
         */
    }
    
    var body: some View {
        VStack {
            context.isBusy ? AnyView(ProgressLoadingView()) : settlements.isEmpty ?
                AnyView(SettlementStubView()) :
                AnyView(SettlementListView(settlements: settlements, picker: context.picker))
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
    SettlementBuilder().build(picker: RoutePickerViewModel())
}
