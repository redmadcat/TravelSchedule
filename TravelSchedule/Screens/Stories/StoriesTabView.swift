//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

struct StoriesTabView: View {
    @Binding var currentStoryIndex: Int
    let stories: [Story]
        
    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(stories.indices, id: \.self) { index in
                StoryView(story: stories[index])
                    .tag(index)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
}
