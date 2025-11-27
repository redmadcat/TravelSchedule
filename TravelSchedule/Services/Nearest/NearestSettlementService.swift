//
//  NearestSettlementService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 24.11.2025.
//

class NearestSettlementService: BaseService, NearestSettlementServiceProtocol {
    // MARK: - NearestStationsServiceProtocol
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCityResponse {
        let response = try await client.getNearestCity(query: .init(
            apikey: apiKey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
}
