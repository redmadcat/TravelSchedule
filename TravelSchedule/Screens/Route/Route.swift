//
//  Route.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 30.12.2025.
//

import SwiftUI

@Observable
final class Route {
    var isValid = false
    private(set) var from = Direction()
    private(set) var to = Direction()
    
    @Observable
    final class Direction: Hashable {
        private(set) var settlement: Settlement?
        private(set) var station: Station?
        var text: String = ""
                
        static func == (lhs: Direction, rhs: Direction) -> Bool {
            ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
        
        func setRoute(settlement: Settlement, station: Station) {
            self.settlement = settlement
            self.station = station
            
            guard let settlementTitle = settlement.title,
                  let stationTitle = station.title else {
                return
            }
            
            text = settlementTitle + " (" + stationTitle + ")"
        }
    }
    
    func validation() {
        if let _ = from.settlement,
           let _ = from.station,
           let _ = to.settlement,
           let _ = to.station {
            isValid = true
        } else {
            isValid = false
        }
    }
    
    func versa() {
        guard let fromSettlement = from.settlement,
              let fromStation = from.station,
              let toSettlement = to.settlement,
              let toStation = to.station else {
            return
        }
        
        from.setRoute(settlement: toSettlement, station: toStation)
        to.setRoute(settlement: fromSettlement, station: fromStation)
    }
}
