//
//  ExtensionSegment.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import Foundation

extension Segment {
    var departureDate: Date {
        let time = getRandomTime()
        return Calendar.current.date(bySettingHour: time.hour, minute: time.minute, second: 00, of: Date())!
    }
    
    var fakeHasTransfers: Bool {
        return Bool.random()
    }
    
    var fakeDepartureDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: departureDate)
    }
    
    var fakeDepartureTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: departureDate)
    }
    
    var durationFromFakeDeparture: String {
        guard let duration = duration else { return .dash }
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        
        return hours > 0 ?
            "\(hours) \(NSLocalizedString("h", comment: .empty)) \(minutes) \(NSLocalizedString("min", comment: .empty))" :
            "\(minutes) \(NSLocalizedString("min", comment: .empty))"
    }
    
    var arrivalText: String {
        guard let duration = duration else { return .dash }
        let arrival = Date().addingTimeInterval(Double(duration))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: arrival)
    }
    
    func getRandomTime() -> (hour: Int, minute: Int) {
        let array = [
            (22, 30),
            (21, 45),
            (01, 15),
            (05, 50),
            (13, 30),
            (13, 45),
            (19, 45)
        ]
        
        return array.randomElement()!
    }
}
