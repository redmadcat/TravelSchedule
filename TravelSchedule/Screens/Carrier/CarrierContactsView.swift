//
//  CarrierContactsView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import SwiftUI

struct CarrierContactsView: View {
    let carrier: Carrier
    
    var body: some View {
        Text(verbatim: "Carrier contacts info")
    }
}

#Preview {
    CarrierContactsView(carrier: Carrier())
}
