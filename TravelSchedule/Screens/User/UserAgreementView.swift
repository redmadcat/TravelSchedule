//
//  UserAgreementView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 18.01.2026.
//

import SwiftUI

struct UserAgreementView: View {
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    UserAgreementTextView(content: "AgreementHeader", font: .system(size: 24, weight: .bold))
                    UserAgreementTextView(content: "AgreementLegalInfo", font: .system(size: 17, weight: .regular), padding: 4)
                    UserAgreementTextView(content: "AgreementTerms", font: .system(size: 24, weight: .bold))
                    UserAgreementTextView(content: "AgreementBody", font: .system(size: 17, weight: .regular))
                }
            }
            .scrollIndicators(.hidden)
            .scrollContentBackground(.hidden)
            .padding(16)
        }
        .navigationTitle("UserAgreement")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButtonView()
            }
        }
    }
}

#Preview {
    UserAgreementView()
}
