//
//  ThemeManager.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

final class ThemeManager {
    static let shared = ThemeManager()
    
    private init() {}
    
    @AppStorage("selectedAppearance") var selectedAppearance: Appearance = .system
    
    func overrideDisplayMode() {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { $0.overrideUserInterfaceStyle = .init(rawValue: selectedAppearance.rawValue) ?? .unspecified }
    }
}
