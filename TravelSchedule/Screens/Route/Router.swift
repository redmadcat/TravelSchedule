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
    
    func showCityList() {
        endpoint.append(.city)
    }
}
