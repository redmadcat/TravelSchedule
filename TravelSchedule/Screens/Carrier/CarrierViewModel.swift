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
    private var segmentsRaw: [Segment] = []
    let route: Route
    var isBusy: Bool = false
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
        defer { isBusy = false }
        
        guard let fromStationCode = route.from.station?.codes?.yandex_code,
              let toStationCode = route.to.station?.codes?.yandex_code else {
            return
        }
                
        do {
            status = .loading
            isBusy = true
                                    
            let response = try await service.search(from: fromStationCode, to: toStationCode)
                        
            for segment in response.segments ?? [] {
                let result = MockDataConverter.convert(segment: segment)
                segmentsRaw.append(result)
            }
            
            self.segmentsRaw = segments.sorted { lhs, rhs in
                if let ldep = lhs.departure, let rdep = rhs.departure {
                    if ldep != rdep {
                        return ldep < rdep
                    }
                }
                return false
            }
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
}
