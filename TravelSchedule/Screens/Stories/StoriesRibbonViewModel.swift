//
//  StoriesRibbonViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.01.2026.
//

import SwiftUI

@Observable
final class StoriesRibbonViewModel {
    var stories: [Story] = MockStories.stories
    var selectedStory: Story?
        
    func visited(_ story: Story) {
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index].visited = true
        }
        selectedStory = nil
    }
}
