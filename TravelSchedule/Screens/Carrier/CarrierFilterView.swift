//
//  CarrierFilterView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierFilterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isEnabled = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("DepartureTime")
                        .padding(.vertical, 8)
                        .font(.system(size: 24, weight: .bold))
                    VStack(spacing: 0) {
                        ForEach(Departure.allCases) { departure in
                            Button {
                                
                            } label: {
                                HStack {
                                    Text(NSLocalizedString(departure.rawValue, comment: .empty))
                                    Spacer()
                                    Image(systemName: "square")
                                        .font(.system(size: 20))
                                }
                                .frame(height: 60)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .foregroundStyle(.ypBlackAD)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("ShowWithTransfers")
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24, weight: .bold))
                    VStack(spacing: 0) {
                        ForEach(Transfer.allCases) { transfer in
                            Button {
                                
                            } label: {
                                HStack {
                                    Text(NSLocalizedString(transfer.rawValue, comment: .empty))
                                    Spacer()
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                }
                                .frame(height: 60)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollContentBackground(.hidden)
            
            Spacer()
            
            VStack {
                Button {
                    dismiss()
                } label: {
                    Text("Apply")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.ypWhite)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .contentShape(Rectangle())
                }
                .background(RoundedRectangle(cornerRadius: 20).fill(.ypBlue))
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 16)
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
    }
}

#Preview {
    CarrierFilterView()
}
