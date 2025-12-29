//
//  ScheduleBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

final class ScheduleBuilder {
    func build(settlement: Settlement?, station: Station?) -> ScheduleView {
        let context = ScheduleViewModel(route: RouteFinderViewModel(router: Router.shared), settlement: settlement, station: station)
        return ScheduleView(context: context)
    }
}
