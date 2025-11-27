//
//  ThreadServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

typealias ThreadStationsResponse = Components.Schemas.ThreadStationsResponse

protocol ThreadServiceProtocol {
    func getRouteStations(uid: String) async throws -> ThreadStationsResponse
}
