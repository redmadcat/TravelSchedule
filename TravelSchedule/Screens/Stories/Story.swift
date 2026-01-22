//
//  Story.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

struct Story: Identifiable, Sendable {
    let id: UUID = UUID()
    var visited: Bool
    let image: Image
    let title: String
    let stories: [Story]
}
