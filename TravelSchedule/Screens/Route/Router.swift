//
//  Router.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

@Observable
final class Router {
    static let shared = Router()
    
    var endpoint: [RouteEndpoint] = []
    
    func toSettlements(context: RoutePickerViewModel) {
        endpoint.append(.settlement(context: context))
    }
    
    func toStations(settlement: Settlement, context: RoutePickerViewModel) {
        endpoint.append(.station(settlement: settlement, context: context))
    }
    
    func toSchedule(settlement: Settlement, station: Station) {
        endpoint.removeAll()
    }
}
