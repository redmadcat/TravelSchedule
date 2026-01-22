//
//  CarrierViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 09.01.2026.
//

import SwiftUI

@MainActor
@Observable
final class CarrierViewModel {
    private let service: SearchServiceProtocol
    private var date: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
    private var segmentsRaw: [Segment] = []
    let route: Route
    var status: APIResponseStatus = .default
    var filter: CarrierFilter
    var segments: [Segment] {
        filter.isApplied ?
        segmentsRaw.filter { filter.apply($0) } :
        segmentsRaw
    }
        
    init(route: Route, filter: CarrierFilter, service: SearchServiceProtocol) {
        self.route = route
        self.filter = filter
        self.service = service
    }
    
    func load() async  {
        guard let fromStationCode = route.from.station?.codes?.yandex_code,
              let toStationCode = route.to.station?.codes?.yandex_code else {
            return
        }
                                
        do {
            status = .loading
            segmentsRaw = try await service.search(from: fromStationCode, to: toStationCode, date: date, transfers: true).sorted { lhs, rhs in
                if lhs.departureDate != rhs.departureDate {
                    return lhs.departureDate < rhs.departureDate
                }
                return false
            }
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
