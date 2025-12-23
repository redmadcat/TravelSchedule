//
//  ProgressLoadingView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 23.12.2025.
//

import SwiftUI

struct ProgressLoadingView: View {
    var body: some View {
        Spacer()
        ProgressView("Loading")
        Spacer()
    }
}

#Preview {
    ProgressLoadingView()
}
