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
        story.image
            .resizable()
            .scaledToFill()
            .frame(width: 92, height: 140)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .opacity(story.visited ? 0.5 : 1)
            .overlay(alignment: .bottomLeading) {
            Text(story.title)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypWhite)
                .opacity(story.visited ? 0.5 : 1)
                .lineLimit(3)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16)
        .strokeBorder(.ypBlue, lineWidth: !story.visited ? 4 : 0))
    }
}

#Preview {
    StoryPreviewView(story: MockStories.stories[0])
}
