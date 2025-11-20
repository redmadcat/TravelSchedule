//
//  TimetableService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class TimetableService: BaseSerivce, TimetableServiceProtocol {
    override init(client: Client, apikey: String) {
        super.init(client: client, apikey: apikey)
    }
    
    // MARK: - TimetableServiceProtocol
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        try await NearestStationsService(client: client, apikey: apikey)
            .getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func search(from: String, to: String, date: String) async throws -> Segments {
        try await SearchService(client: client, apikey: apikey)
            .search(from: from, to: to, date: date)
    }
    
    func getCopyright() async throws -> Copyright {
        try await CopyrightService(client: client, apikey: apikey).getCopyright()
    }
}
