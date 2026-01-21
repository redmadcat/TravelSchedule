//
//  StationBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 21.01.2026.
//

final class StationBuilder {
    func build(settlement: Settlement, direction: Route.Direction) -> StationView {
        let context = StationViewModel(settlement: settlement, direction: direction)
        return StationView(context: context)
    }
}
