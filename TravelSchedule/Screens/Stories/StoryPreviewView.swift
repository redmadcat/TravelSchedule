//
//  StoryPreviewView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

struct StoryPreviewView: View {
    var story: Story
    
    var body: some View {
        image.overlay(alignment: .bottomLeading) {
            Text(story.title)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypWhite)
                .opacity(story.viewed ? 0.5 : 1)
                .lineLimit(3)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
    }
    
    private var image: some View {
        story.image
            .resizable()
            .scaledToFill()
            .frame(width: 92, height: 140)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .opacity(story.viewed ? 0.5 : 1)
    }
}

#Preview {
    StoryPreviewView(story: MockStories.stories[0])
}
