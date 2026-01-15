//
//  ExtensionSegment.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import Foundation

typealias TicketsInfo = Components.Schemas.TicketsInfo

extension Segment {
    var fakeHasTransfers: Bool {
        return tickets_info != nil ? true : false
    }
    
    var fakeDepartureDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: departure ?? Date())
    }
    
    var fakeDepartureTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: departure ?? Date())
    }
    
    var durationFromFakeDeparture: Int {
        guard let duration = duration else { return 0 }
        let hours = duration / 3600
        return hours
    }
    
    var arrivalTime: String {
        guard let duration = duration else { return .dash }
        let arrival = (departure ?? Date()).addingTimeInterval(Double(duration))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: arrival)
    }
}
