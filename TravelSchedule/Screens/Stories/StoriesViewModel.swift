//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.01.2026.
//

import SwiftUI

@Observable
final class StoriesViewModel {
    let stories: [Story]
    var timerConfiguration: TimerConfiguration { .init(storiesCount: stories.count) }
    var currentStoryIndex: Int = 0
    var currentProgress: CGFloat = 0
    
    init(stories: [Story]) {
        self.stories = stories
    }
    
    func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
    }

    func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
    }
}
