//
//  SettlementViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 22.12.2025.
//

import SwiftUI

@MainActor
@Observable
final class SettlementViewModel {
    private let service: StationsServiceProtocol
    private var settlementsRaw: [Settlement] = []
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
        do {
            status = .loading
            settlementsRaw = try await service.getAllStations()
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
