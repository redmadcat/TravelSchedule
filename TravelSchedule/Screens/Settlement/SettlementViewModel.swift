//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

@Observable
final class SettlementViewModel {
    private let country = "Россия"
    private let service: StationsServiceProtocol
    private var settlementsRaw: [Settlement] = []
    var isBusy: Bool = false
    var request: String = .empty
    var direction: Route.Direction
    var status: APIResponseStatus = .default
    var settlements: [Settlement] {
        request.isEmpty ?
            settlementsRaw :
            settlementsRaw.filter {
                guard let title = $0.title else { return false }
                return title.localizedCaseInsensitiveContains(request)
            }
    }
            
    init(direction: Route.Direction, service: StationsServiceProtocol) {
        self.service = service
        self.direction = direction
    }
    
    func load() async {
        defer { isBusy = false }
                
        do {
            status = .loading
            isBusy = true
            let response = try await service.getAllStations()
            if let result = response.countries?.filter({ $0.title == country }).first {
                if let regions = result.regions {
                    // Fetched most appropriate regions for test purpose
                    if let regionMsk = regions[37].settlements, let regionSpb = regions[53].settlements {
                        settlementsRaw = regionMsk + regionSpb
                            .filter {
                                guard let title = $0.title else { return false }
                                return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                            }
                    }
                }
            }
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
