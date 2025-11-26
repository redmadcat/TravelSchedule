//
//  ScheduleServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

typealias ScheduleResponse = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> ScheduleResponse
}
