//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

struct StoriesView: View {
    @State var context: StoriesViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(currentStoryIndex: $context.currentStoryIndex, stories: context.stories)
                .onChange(of: context.currentStoryIndex) { oldValue, newValue in
                    context.didChangeCurrentIndex(oldIndex: oldValue, newIndex: newValue)
                }

            StoriesProgressBarView(
                storiesCount: context.stories.count,
                timerConfiguration: context.timerConfiguration,
                currentProgress: $context.currentProgress
            )
            .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            .onChange(of: context.currentProgress) { _, newValue in
                context.didChangeCurrentProgress(newProgress: newValue)
            }
        }
    }
}

#Preview {
    StoriesView(context: StoriesViewModel(stories: MockStories.stories[1].stories))
}
