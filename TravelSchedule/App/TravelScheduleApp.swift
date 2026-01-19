//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.11.2025.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    ThemeManager.shared.overrideDisplayMode()
                }
        }
    }
}
