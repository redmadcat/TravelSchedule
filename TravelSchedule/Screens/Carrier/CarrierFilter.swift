//
//  CarrierFilter.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.01.2026.
//

import UIKit

@MainActor
@Observable
final class CarrierFilter: Hashable {
    var departures: Set<Departure> = []
    var transfers: Transfer?
    var isApplied = false
    
    func toggle(_ departure: Departure) {
        if departures.contains(departure) {
            departures.remove(departure)
        } else {
            departures.insert(departure)
        }
    }
    
    func toggle(_ transfers: Transfer) {
        self.transfers = transfers
    }
    
    func apply(_ segment: Segment) -> Bool {
        let time = departures.contains { $0.isInBetween(departure: segment.departureDate) }
        
        let transfer: Bool = {
            switch transfers {
            case .yes: return segment.hasTransfers
            case .no: return !segment.hasTransfers
            default:
                return false
            }
        }()
        
        return time && transfer
    }
    
    func toggled(_ departure: Departure) -> Bool {
        return departures.contains(departure)
    }
    
    func toggled(_ transfers: Transfer) -> Bool {
        return self.transfers == transfers
    }
    
    nonisolated static func == (lhs: CarrierFilter, rhs: CarrierFilter) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    func isSet() -> Bool {
        return !departures.isEmpty && transfers != nil
    }
    
    func set() {
        isApplied = !departures.isEmpty
    }
}
