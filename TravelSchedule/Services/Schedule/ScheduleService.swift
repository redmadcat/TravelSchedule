//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class ScheduleService: BaseService, ScheduleServiceProtocol {
    // MARK: - ScheduleServiceProtocol
    func getStationSchedule(station: String) async throws -> ScheduleResponse {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apiKey,
            station: station
        ))
        return try response.ok.body.json
    }
}
