//
//  SettlementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

struct SettlementView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var request: String = ""
    
    let mockSettlements = ["Москва", "Санкт Петербург", "Сочи", "Пятигорск", "Саратов", "Казань", "Новосибирск", "Краснодар"]
    
    private var filteredResults: [String] {
        request.isEmpty ? mockSettlements : mockSettlements.filter { $0.localizedCaseInsensitiveContains(request) }
    }
    
    var body: some View {
        VStack {
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
        }
        .backgroundStyle(.ypWhite)
    }
}

#Preview {
    SettlementView()
}
