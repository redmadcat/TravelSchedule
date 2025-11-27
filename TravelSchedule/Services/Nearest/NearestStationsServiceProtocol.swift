//
//  NearestStationsServiceProtocol.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 17.11.2025.
//

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}
