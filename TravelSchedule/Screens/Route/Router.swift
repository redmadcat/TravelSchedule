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
        
    func toSettlements(direction: Route.Direction) {
        endpoint.append(.settlement(direction: direction))
    }
    
    func toStations(settlement: Settlement, direction: Route.Direction) {
        endpoint.append(.station(settlement: settlement, direction: direction))
    }
    
    func toCarrier(route: Route) {
        endpoint.append(.carrier(route: route))
    }
    
    func toContacts(carrier: Carrier) {
        endpoint.append(.contacts(carrier: carrier))
    }
    
    func toFilter(filter: CarrierFilter) {
        endpoint.append(.filter(filter: filter))
    }
    
    func toAgreement() {
        endpoint.append(.agreement)
    }
    
    func toRoot() {
        endpoint.removeAll()
    }
}
