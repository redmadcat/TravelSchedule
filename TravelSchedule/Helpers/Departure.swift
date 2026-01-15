//
//  Departure.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 14.01.2026.
//

import Foundation

enum Departure: String, CaseIterable, Identifiable {
    case morning = "Morning"
    case day = "Day"
    case evening = "Evening"
    case night = "Night"
    
    var id: String { rawValue }
    
    func isInBetween(departure: Date) -> Bool {
        let hour = Calendar.current.component(.hour, from: departure)
        
        switch self {
        case .morning:
            return (6..<12).contains(hour)
        case .day:
            return (12..<18).contains(hour)
        case .evening:
            return (18..<24).contains(hour)
        case .night:
            return (0..<6).contains(hour)
        }
    }
}
