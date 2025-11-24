//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class ThreadService: BaseSerivce, ThreadServiceProtocol {
    // MARK: - ThreadServiceProtocol
    func getRouteStations(uid: String, date: String?) async throws -> ThreadStationsResponse {
        let response = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid,
            date: date
        ))
        return try response.ok.body.json
    }
}
