//
//  RouteEndpoint.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

enum RouteEndpoint: String, Hashable, Identifiable {
    case city
    case station
    
    var id: String { self.rawValue }
}
