//
//  StoriesRibbonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.01.2026.
//

import SwiftUI

struct StoriesRibbonView: View {
    @State private var stories: [Story] = MockStories.stories
    @State private var selectedStory: Story?
    
    var body: some View {
        ScrollView(.horizontal) {
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
                                    if let index = stories.firstIndex(where: { $0.id == story.id }) {
                                        stories[index].visited = true
                                    }
                                    selectedStory = nil
                                }
                                .padding(.top, 57)
                                .padding(.trailing, 16)
                            }
                        }
                }
            }
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
            .frame(height: 140)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoriesRibbonView()
}
