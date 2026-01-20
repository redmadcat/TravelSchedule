//
//  StoriesRibbonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.01.2026.
//

import SwiftUI

struct StoriesRibbonView: View {
    @State private var stories: [Story] = MockStories.stories
    @State private var selectedStory: Story? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(stories) { story in
                    StoryPreviewView(story: story)
                        .onTapGesture {
                            selectedStory = story
                        }
                        .fullScreenCover(item: $selectedStory) { story in
                            ZStack(alignment: .topTrailing) {
                                StoriesView(stories: story.stories)
                                Button(String.empty, image: .close) {
                                    selectedStory = nil
                                }
                                .padding(.top, 57)
                                .padding(.trailing, 12)
                            }
                        }
                }
            }
            .frame(height: 140)
        }
    }
}

#Preview {
    StoriesRibbonView()
}
