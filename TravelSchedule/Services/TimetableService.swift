//
//  TimetableService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class TimetableService: BaseSerivce, TimetableServiceProtocol {
    // MARK: - TimetableServiceProtocol
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        try await NearestStationsService(client: client, apikey: apikey)
            .getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func search(from: String, to: String, date: String?) async throws -> Segments {
        try await SearchService(client: client, apikey: apikey)
            .search(from: from, to: to, date: date)
    }
    
    func getStationSchedule(station: String, date: String?) async throws -> ScheduleResponse {
        try await ScheduleService(client: client, apikey: apikey)
            .getStationSchedule(station: station, date: date)
    }
    
    func getRouteStations(uid: String, date: String?) async throws -> ThreadStationsResponse {
        try await ThreadService(client: client, apikey: apikey)
            .getRouteStations(uid: uid, date: date)
    }
    
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCityResponse {
        try await NearestSettlementService(client: client, apikey: apikey).getNearestCity(lat: lat, lng: lng)
    }
    
    func getCarrierInfo(code: String, system: String?) async throws -> CarrierResponse {
        try await CarrierService(client: client, apikey: apikey).getCarrierInfo(code: code, system: system)
    }
    
    func getAllStations() async throws -> AllStationsResponse {
        try await StationsService(client: client, apikey: apikey).getAllStations()
    }
    
    func getCopyright() async throws -> Copyright {
        try await CopyrightService(client: client, apikey: apikey).getCopyright()
    }
}
