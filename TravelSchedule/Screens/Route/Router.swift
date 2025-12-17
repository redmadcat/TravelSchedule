//
//  RouterViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

@Observable
final class RouterViewModel {
    static let shared = RouterViewModel()
    
    var endpoint: [RouteEndpoint] = []
    
    func showCityList() {
        endpoint.append(.city)
    }
}
