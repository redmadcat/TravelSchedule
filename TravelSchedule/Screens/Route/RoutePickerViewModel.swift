//
//  RoutePickerViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.12.2025.
//

import SwiftUI

@Observable
final class RoutePickerViewModel : Hashable {
    static func == (lhs: RoutePickerViewModel, rhs: RoutePickerViewModel) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    var text: String = ""
}
