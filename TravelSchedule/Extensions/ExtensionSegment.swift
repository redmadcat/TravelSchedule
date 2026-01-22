//
//  ExtensionSegment.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import Foundation

extension Segment {
    var hasTransfers: Bool {
        guard let has_transfers else { return false }
        return has_transfers
    }
    
    var departureDate: Date {
        guard let departure else { return Date() }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: departure) ?? Date()
    }
    
    var arrivalDate: Date {
        guard let arrival else { return Date() }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: arrival) ?? Date()
    }
        
    var departureDay: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: departureDate)
    }
    
    var departureTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: departureDate)
    }
    
    var arrivalTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: arrivalDate)
    }
    
    var durationHours: Int {
        guard let duration = duration else { return 0 }
        let hours = duration / 3600
        return hours
    }
}
