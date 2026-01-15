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
                        
            for segment in response.segments ?? [] {
                let result = Segment(from: segment.from,
                                     to: segment.to,
                                     departure: getRandomTime(),
                                     arrival: Date(),
                                     thread: segment.thread,
                                     tickets_info: getRandomInfo(),
                                     duration: segment.duration)
                segments.append(result)
            }
            
            self.segments = segments.sorted { lhs, rhs in
                if let lhsDate = lhs.departure, let rhsDate = rhs.departure {
                    if lhsDate != rhsDate {
                        return lhsDate < rhsDate
                    }
                }
                return false
            }
            status = .success
        } catch {
            status = error is URLError ? .failure(.network) : .failure(.server)
        }
    }
    
    func getRandomInfo() -> TicketsInfo? {
        let array = [
            TicketsInfo(),
            nil
        ]
        return array.randomElement()!
    }
    
    func getRandomTime() -> Date {
        let array = [
            (22, 30),
            (21, 45),
            (01, 15),
            (05, 50),
            (13, 30),
            (13, 45),
            (19, 45)
        ]
        
        let time = array.randomElement()!
        return Calendar.current.date(bySettingHour: time.0, minute: time.1, second: 00, of: Date())!
    }
}
