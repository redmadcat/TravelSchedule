//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

final class ScheduleService: BaseSerivce, ScheduleServiceProtocol {
    // MARK: - ScheduleServiceProtocol
    func getStationSchedule(station: String, date: String?) async throws -> ScheduleResponse {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
}
