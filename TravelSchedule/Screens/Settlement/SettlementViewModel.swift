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
    var status: APIResponseStatus = .default
    
    init(router: Router, service: StationsServiceProtocol) {
        self.service = service
        super.init(router: router)
        
        Task { await load() }
    }
    
    private func load() async {
        defer { isBusy = false }
                
        do {
            status = .loading
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
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
