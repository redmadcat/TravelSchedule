//
//  CarrierViewModel.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 09.01.2026.
//

import SwiftUI

@Observable
final class CarrierViewModel {
    private let service: SearchServiceProtocol
    var isBusy: Bool = false
    var segments: [Segment] = []
    var status: APIResponseStatus = .default
        
    init(service: SearchServiceProtocol) {
        self.service = service
    }
    
    func load(route: Route) async  {
        defer { isBusy = false }
        
        guard let fromStationCode = route.from.station?.codes?.yandex_code,
              let toStationCode = route.to.station?.codes?.yandex_code else {
            return
        }
                
        do {
            status = .loading
            isBusy = true
                                    
            let response = try await service.search(from: fromStationCode, to: toStationCode)
            
            let segments = response.segments ?? []
            
            self.segments = segments.sorted { lhs, rhs in
                
                if let lhsDate = lhs.departure, let rhsDate = rhs.departure {
                    if lhsDate != rhsDate {
                        return lhsDate < rhsDate
                    }
                }
                return false
            }
            status = .success
            print(segments)
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
