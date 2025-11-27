//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class ThreadService: BaseService, ThreadServiceProtocol {
    // MARK: - ThreadServiceProtocol
    func getRouteStations(uid: String) async throws -> ThreadStationsResponse {
        let response = try await client.getRouteStations(query: .init(
            apikey: apiKey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}
