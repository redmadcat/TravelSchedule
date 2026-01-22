//
//  StoriesRibbonView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.01.2026.
//

import SwiftUI

struct StoriesRibbonView: View {
    @State var context: StoriesRibbonViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(context.stories) { story in
                    StoryPreviewView(story: story)
                        .onTapGesture {
                            context.selectedStory = story
                        }
                        .fullScreenCover(item: $context.selectedStory) { story in
                            ZStack(alignment: .topTrailing) {
                                StoriesView(context: StoriesViewModel(stories: story.stories))
                                Button(String.empty, image: .close) {
                                    context.visited(story)
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
    StoriesRibbonView(context: StoriesRibbonViewModel())
}
