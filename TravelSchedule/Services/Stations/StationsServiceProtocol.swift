//
//  StationsServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 25.11.2025.
//

typealias AllStationsResponse = Components.Schemas.AllStationsResponse

protocol StationsServiceProtocol: Sendable {
    func getAllStations() async throws -> [Settlement]
}
