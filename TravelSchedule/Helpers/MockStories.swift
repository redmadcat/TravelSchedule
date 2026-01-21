//
//  MockStories.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 19.01.2026.
//

import SwiftUI

final class MockStories {
    private static let title1 = "Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 Text1 "
    
    private static let title2 = "Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 Text2 "
    
    private static let title3 = "Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 Text3 "
    
    private static let title4 = "Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 Text4 "
    
    private static let title5 = "Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 Text5 "
    
    private static let title6 = "Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 Text6 "
    
    private static let title7 = "Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 Text7 "
    
    private static let title8 = "Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 Text8 "
    
    private static let title9 = "Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 Text9 "
        
    static let stories = [
        Story(visited: false, image: Image(.preview1), title: title1, stories: [
            Story(visited: false, image: Image(.story1), title: title1, stories: []),
            Story(visited: false, image: Image(.story2), title: title1, stories: [])
        ]),
        Story(visited: false, image: Image(.preview2), title: title2, stories: [
            Story(visited: false, image: Image(.story3), title: title2, stories: []),
            Story(visited: false, image: Image(.story4), title: title2, stories: [])
        ]),
        Story(visited: false, image: Image(.preview3), title: title3, stories: [
            Story(visited: false, image: Image(.story5), title: title3, stories: []),
            Story(visited: false, image: Image(.story6), title: title3, stories: [])
        ]),
        Story(visited: false, image: Image(.preview4), title: title4, stories: [
            Story(visited: false, image: Image(.story7), title: title4, stories: []),
            Story(visited: false, image: Image(.story8), title: title4, stories: [])
        ]),
        Story(visited: false, image: Image(.preview5), title: title5, stories: [
            Story(visited: false, image: Image(.story9), title: title5, stories: []),
            Story(visited: false, image: Image(.story10), title: title5, stories: [])
        ]),
        Story(visited: false, image: Image(.preview6), title: title6, stories: [
            Story(visited: false, image: Image(.story11), title: title6, stories: []),
            Story(visited: false, image: Image(.story12), title: title6, stories: [])
        ]),
        Story(visited: false, image: Image(.preview7), title: title7, stories: [
            Story(visited: false, image: Image(.story13), title: title7, stories: []),
            Story(visited: false, image: Image(.story14), title: title7, stories: [])
        ]),
        Story(visited: false, image: Image(.preview8), title: title8, stories: [
            Story(visited: false, image: Image(.story15), title: title8, stories: []),
            Story(visited: false, image: Image(.story16), title: title8, stories: [])
        ]),
        Story(visited: false, image: Image(.preview9), title: title9, stories: [
            Story(visited: false, image: Image(.story17), title: title9, stories: []),
            Story(visited: false, image: Image(.story18), title: title9, stories: [])
        ])
    ]
}
