//
//  RouteExtension.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 05.01.2026.
//

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension Route.Direction: Hashable {
    static func == (lhs: Route.Direction, rhs: Route.Direction) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
