//
//  RouteEndpoint.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

enum RouteEndpoint: Hashable {
    case settlement(context: RoutePickerViewModel)
    case station(settlement: Settlement, context: RoutePickerViewModel)
}
