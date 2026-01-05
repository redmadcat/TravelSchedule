//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text(verbatim: "Settings")
            Spacer()
            Divider()
                .overlay(.ypGrayAD)
                .frame(minHeight: 1)
        }
        .background(.ypWhiteAD)
    }
}

#Preview {
    SettingsView()
}
