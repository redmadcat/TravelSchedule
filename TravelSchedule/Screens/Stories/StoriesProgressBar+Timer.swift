//
//  StoriesProgressBar+Timer.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.01.2026.
//

import SwiftUI

extension StoriesProgressBar {
    static func makeTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
