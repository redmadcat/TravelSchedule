//
//  CarrierView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

import SwiftUI

struct CarrierView: View {
    let route: Route
    
    var body: some View {
        VStack {
            Text(verbatim: "CarrierView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.ypWhiteAD)
    }
}

#Preview {
    CarrierView(route: Route())
}
