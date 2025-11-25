//
//  ScheduleServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

typealias ScheduleResponse = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getStationSchedule(station: String, date: String?) async throws -> ScheduleResponse
}
