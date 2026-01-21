//
//  StationViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 21.01.2026.
//

import SwiftUI

@Observable
final class StationViewModel {
    let settlement: Settlement
    var direction: Route.Direction
    var request: String = .empty
    var stations: [Station] {
        request.isEmpty ?
            settlement.stations ?? [] :
            settlement.stations?.filter {
                guard let title = $0.title else { return false }
                return title.localizedCaseInsensitiveContains(request)
            } ?? []
    }
    
    init(settlement: Settlement, direction: Route.Direction) {
        self.settlement = settlement
        self.direction = direction        
    }
}
