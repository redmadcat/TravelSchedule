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
        Story(visited: false, image: Image("Preview1"), title: title1, stories: [
            Story(visited: false, image: Image("Story1"), title: title1, stories: []),
            Story(visited: false, image: Image("Story2"), title: title1, stories: [])
        ]),
        Story(visited: false, image: Image("Preview2"), title: title2, stories: [
            Story(visited: false, image: Image("Story3"), title: title2, stories: []),
            Story(visited: false, image: Image("Story4"), title: title2, stories: [])
        ]),
        Story(visited: false, image: Image("Preview3"), title: title3, stories: [
            Story(visited: false, image: Image("Story5"), title: title3, stories: []),
            Story(visited: false, image: Image("Story6"), title: title3, stories: [])
        ]),
        Story(visited: false, image: Image("Preview4"), title: title4, stories: [
            Story(visited: false, image: Image("Story7"), title: title4, stories: []),
            Story(visited: false, image: Image("Story8"), title: title4, stories: [])
        ]),
        Story(visited: false, image: Image("Preview5"), title: title5, stories: [
            Story(visited: false, image: Image("Story9"), title: title5, stories: []),
            Story(visited: false, image: Image("Story10"), title: title5, stories: [])
        ]),
        Story(visited: false, image: Image("Preview6"), title: title6, stories: [
            Story(visited: false, image: Image("Story11"), title: title6, stories: []),
            Story(visited: false, image: Image("Story12"), title: title6, stories: [])
        ]),
        Story(visited: false, image: Image("Preview7"), title: title7, stories: [
            Story(visited: false, image: Image("Story13"), title: title7, stories: []),
            Story(visited: false, image: Image("Story14"), title: title7, stories: [])
        ]),
        Story(visited: false, image: Image("Preview8"), title: title8, stories: [
            Story(visited: false, image: Image("Story15"), title: title8, stories: []),
            Story(visited: false, image: Image("Story16"), title: title8, stories: [])
        ]),
        Story(visited: false, image: Image("Preview9"), title: title9, stories: [
            Story(visited: false, image: Image("Story17"), title: title9, stories: []),
            Story(visited: false, image: Image("Story18"), title: title9, stories: [])
        ])
    ]
}
