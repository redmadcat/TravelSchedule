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
    @State var filter: CarrierFilter
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("DepartureTime")
                            .padding(.vertical, 10)
                            .font(.system(size: 24, weight: .bold))
                        VStack(spacing: 0) {
                            ForEach(Departure.allCases) { departure in
                                Button {
                                    filter.toggle(departure)
                                } label: {
                                    HStack {
                                        Text(NSLocalizedString(departure.rawValue, comment: .empty))
                                            .font(.system(size: 17, weight: .regular))
                                        Spacer()
                                        Image(systemName: filter.toggled(departure) ? "checkmark.square.fill" : "square")
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
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 24, weight: .bold))
                        VStack(spacing: 0) {
                            ForEach(Transfer.allCases) { transfer in
                                Button {
                                    filter.toggle(transfer)
                                } label: {
                                    HStack {
                                        Text(NSLocalizedString(transfer.rawValue, comment: .empty))
                                            .font(.system(size: 17, weight: .regular))
                                        Spacer()
                                        Image(systemName: filter.toggled(transfer) ? "largecircle.fill.circle" : "circle")
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
                        filter.set()
                        dismiss()
                    } label: {
                        Text("Apply")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(.ypWhite)
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .contentShape(Rectangle())
                    }
                    .background(RoundedRectangle(cornerRadius: 16).fill(.ypBlue))
                    .padding(.bottom, 24)
                }
                .opacity(filter.isSet() ? 1 : 0)
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
}

#Preview {
    CarrierFilterView(filter: CarrierFilter())
}
