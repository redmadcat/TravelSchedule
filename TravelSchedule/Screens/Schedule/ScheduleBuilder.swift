//
//  ScheduleBuilder.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

import SwiftUI

final class ScheduleBuilder {
    func build() -> ScheduleView {
        let router = Router.shared
        let context = ScheduleViewModel(router: router)
        return ScheduleView(context: context)
    }
}
