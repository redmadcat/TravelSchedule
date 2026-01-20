//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                story.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .leading, spacing: 16) {
                    Text(story.title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.ypWhite)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text(story.title)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundStyle(.ypWhite)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .background(.ypBlack)
    }
}

#Preview {
    StoryView(story: MockStories.stories[0])
}
