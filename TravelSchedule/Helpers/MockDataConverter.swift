//
//  MockDataConverter.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 16.01.2026.
//

import Foundation

final class MockDataConverter {
    static func convert(segment: Segment) -> Segment {
        return Segment(from: segment.from,
                         to: segment.to,
                         departure: getRandomTime(),
                         arrival: Date(),
                         thread: segment.thread,
                         tickets_info: getRandomInfo(),
                         duration: segment.duration)
    }
    
    static func getRandomInfo() -> TicketsInfo? {
        let array = [
            TicketsInfo(),
            nil
        ]
        return array.randomElement()!
    }
    
    static func getRandomTime() -> Date {
        let array = [
            (22, 30),
            (21, 45),
            (01, 15),
            (05, 50),
            (13, 30),
            (13, 45),
            (19, 45)
        ]
        
        let time = array.randomElement()!
        return Calendar.current.date(bySettingHour: time.0, minute: time.1, second: 00, of: Date())!
    }
}
