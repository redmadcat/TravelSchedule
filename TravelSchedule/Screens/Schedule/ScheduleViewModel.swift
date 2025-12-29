//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

final class ScheduleViewModel {
    var route: RouteFinderViewModel
    
    init(route: RouteFinderViewModel, settlement: Settlement?, station: Station?) {
        self.route = route
        
        guard let settlementTitle = settlement?.title, let stationTitle = station?.title else { return }
        self.route.from.text = settlementTitle + " (" + stationTitle + ")"
    }
}

