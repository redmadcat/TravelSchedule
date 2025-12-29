//
//  StationViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

@Observable
final class StationViewModel: RouterViewModel {
    var picker: RoutePickerViewModel
    
    init(router: Router, picker: RoutePickerViewModel) {
        self.picker = picker
        super.init(router: router)
    }
}
