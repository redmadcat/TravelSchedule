//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.12.2025.
//

final class ScheduleViewModel {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func toSettlements() {
        self.router.toSettlements()
    }
}
