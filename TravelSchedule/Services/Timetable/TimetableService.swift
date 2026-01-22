//
//  TimetableService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

actor TimetableService: TimetableServiceProtocol {
    private(set) var client: Client
    private(set) var apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - TimetableServiceProtocol
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        try await NearestStationsService(client: client, apiKey: apiKey)
            .getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func search(from: String, to: String, date: String?, transfers: Bool? = true) async throws -> [Segment] {
        try await SearchService(client: client, apiKey: apiKey)
            .search(from: from, to: to, date: date, transfers: transfers)
    }
    
    func getStationSchedule(station: String) async throws -> ScheduleResponse {
        try await ScheduleService(client: client, apiKey: apiKey)
            .getStationSchedule(station: station)
    }
    
    func getRouteStations(uid: String) async throws -> ThreadStationsResponse {
        try await ThreadService(client: client, apiKey: apiKey).getRouteStations(uid: uid)
    }
    
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCityResponse {
        try await NearestSettlementService(client: client, apiKey: apiKey).getNearestCity(lat: lat, lng: lng)
    }
    
    func getCarrierInfo(code: String) async throws -> CarrierResponse {
        try await CarrierService(client: client, apiKey: apiKey).getCarrierInfo(code: code)
    }
    
    func getAllStations() async throws -> [Settlement] {
        try await StationsService(client: client, apiKey: apiKey).getAllStations()
    }
    
    func getCopyright() async throws -> Copyright {
        try await CopyrightService(client: client, apiKey: apiKey).getCopyright()
    }
}
