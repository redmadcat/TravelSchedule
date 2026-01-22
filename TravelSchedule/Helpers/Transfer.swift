//
//  Transfer.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 14.01.2026.
//

enum Transfer: String, CaseIterable, Identifiable, Sendable {
    case yes = "Yes"
    case no = "No"
    
    var id: String { rawValue }
}
