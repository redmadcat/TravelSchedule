//
//  TimetableServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 20.11.2025.
//

protocol TimetableServiceProtocol:
    NearestStationsServiceProtocol,
    SearchServiceProtocol,
    ScheduleServiceProtocol,
    ThreadServiceProtocol,
    NearestSettlementServiceProtocol,
    CopyrightServiceProtocol {
}
