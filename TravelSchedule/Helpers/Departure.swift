//
//  Departure.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 14.01.2026.
//

enum Departure: String, CaseIterable, Identifiable {
    case morning = "Morning"
    case day = "Day"
    case evening = "Evening"
    case night = "Night"
    
    var id: String { rawValue }
}
