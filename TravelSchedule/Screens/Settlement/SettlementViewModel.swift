//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

@Observable
final class SettlementViewModel: RouterViewModel {
    private let country = "Россия"
    private let service: StationsServiceProtocol
    var isBusy: Bool = false
    var settlements: [Settlement] = []
    var picker: RoutePickerViewModel
    
    init(router: Router, service: StationsServiceProtocol, picker: RoutePickerViewModel) {
        self.service = service
        self.picker = picker
        super.init(router: router)
        
        Task { await load() }
    }
    
    private func load() async {
        defer { isBusy = false }
        
        do {
            isBusy = true
            let response = try await service.getAllStations()
            if let result = response.countries?.filter({ $0.title == country }).first {
                if let regions = result.regions {
                    let result = regions[0].settlements ?? []
                    
                    settlements = result
                        .filter {
                            guard let title = $0.title else { return false }
                            return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        }
                }
            }
        } catch {
            print(error)
        }
    }
}
