//
//  RouteFinderViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

final class RouteFinderViewModel: RouterViewModel {
    var from = RoutePickerViewModel()
    var to = RoutePickerViewModel()
        
    func toSettlements(context: RoutePickerViewModel) {
        router.toSettlements(context: context)
    }
}
