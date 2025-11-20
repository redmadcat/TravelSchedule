//
//  NearestStationsService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.11.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class NearestStationsService: BaseSerivce, NearestStationsServiceProtocol {
    override init(client: Client, apikey: String) {
        super.init(client: client, apikey: apikey)
    }
        
    // MARK: - NearestStationsServiceProtocol
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}
