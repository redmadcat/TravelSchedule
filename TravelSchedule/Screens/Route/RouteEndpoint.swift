//
//  RouteEndpoint.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

enum RouteEndpoint: Hashable {
    case settlement(direction: Route.Direction)
    case station(settlement: Settlement, direction: Route.Direction)
}
